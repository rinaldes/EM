class FilesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:destroy, :create]
  before_filter :prepare_parent, only: [:index, :create, :destroy]
  before_filter :get_files_list, only: :index

  def index
    @file = EventFile.new
  end

  def create
    @file = EventFile.new(file_params)
    @file.user_id = current_user.id
    @file.event_id = @event.id
    respond_to do |format|
      if @file.save
        get_files_list
        format.js {render :layout => false}
      else
        format.js {render :layout => false}
      end
    end
  end

  def destroy
    @file = EventFile.find(params[:id])
    @file.destroy
    get_files_list
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  private
    def file_params
      params.require(:event_file).permit(:file, :title)
    end

    def prepare_parent
      @event = Event.find_by_id(params[:event_id])
    end

    def get_files_list
      results = @event.event_files.joins(:user).search(params[:search])
      if results.present?
        results = results.order('created_at DESC')
        @files = results.page(params[:page]).per(PER_PAGE)
      end
    end
end
