class RealizationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:destroy]
  before_filter :prepare_event, only: [:show, :edit, :update, :destroy]
  before_filter :prepare_production_types, only: [:show, :edit, :update, :destroy]

  def show; end
  def edit; end

  def update
    params[:event][:realizations_attributes]["0"][:quantity] =  params[:event][:realizations_attributes]["0"][:quantity].split(',').join.to_i if params[:event][:realizations_attributes]["0"][:quantity].present?
    params[:event][:realizations_attributes]["0"][:price] =  params[:event][:realizations_attributes]["0"][:price].split(',').join.to_i if params[:event][:realizations_attributes]["0"][:price].present?

    if params[:new_item].present?
      new_item = ProductionItem.find_or_initialize_by(:name => params[:new_item]) 
      new_item.update(:name => params[:new_item])
      params[:event][:realizations_attributes]["0"][:production_item_id] = new_item.id
    end

    if @event.update_attributes(realization_params)
      flash[:notice] = 'Realization was successfully updated.'
    else
      flash[:error] = @event.errors.full_messages
    end
    redirect_to edit_event_realizations_path(:event_id => @event.id, :type => @production_type)
  end

  def destroy
    @realization = Realization.find(params[:id])
    type = @realization.production_type.code
    if @realization.destroy
      flash[:notice] = 'Realization was successfully deleted.'
      redirect_to edit_event_realizations_path(:event_id => @event.id, :type => type)
    else
      flash[:error] = @session_feedback.errors.full_messages
      render :edit
    end
  end

  private
    def realization_params
      params.require(:event).permit(realizations_attributes: [:id, :production_item_id, :production_type_id, :quantity, :days, :price, :notes, :_destroy])
    end

    def prepare_event
      @event = Event.find(params[:event_id])
      @production_type = params[:type]
      @production_type_id = ProductionType.where(:code => @production_type).first.id if @production_type.present?
    end

    def prepare_production_types
      @production_types = ProductionType.all.order('order_number asc')
    end
end
