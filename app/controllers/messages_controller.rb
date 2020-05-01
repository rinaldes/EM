class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:update, :create, :destroy]
  before_filter :prepare_parent
  before_filter :get_users, only: [:new, :edit]
  before_filter :find_message, only: [:edit, :update, :send_broadcast_message]
  before_filter :get_messages_list, only: :index

  def index;end

  def new
    @message = Message.new
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  def create
    @message = Message.new(message_params)
    @message.event_id = @event.id
    respond_to do |format|
      if @message.save
        get_messages_list
        format.js {render :layout => false}
      else
        format.js {render :layout => false}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  def update
    respond_to do |format|
      if @message.update_attributes(message_params)
        get_messages_list
        format.js {render :layout => false}
      else
        format.js {render :layout => false}
      end
    end
  end

  def destroy
    @message.destroy
    get_messages_list
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  def send_broadcast_message
    @broadcast = Message.broadcast_message(@message)
    respond_to do |format|
      get_messages_list
      format.js {render :layout => false}
    end
  end

  private
    def get_users
      @users = User.joins(:events).where("events.id = ? AND users.registration_id IS NOT NULL", @event.id).order(:name)
    end

    def find_message
      @message = Message.find(params[:id])
      @array_user_id = @message.user_ids.split(",").map(&:to_i) if @message.present? && @message.user_ids.present?
    end

    def get_messages_list
      results = @event.messages.search(params[:search])
      if results.present?
        results = results.order('created_at DESC')
        @messages = results.page(params[:page]).per(PER_PAGE)
      end
    end

    def message_params
      params[:message][:user_ids] = params[:message][:user_ids].join(", ") if params[:message][:user_ids].present?
      params.require(:message).permit(:message, :user_ids)
    end

    def prepare_parent
      @event = Event.find_by_id(params[:event_id])
    end
end
