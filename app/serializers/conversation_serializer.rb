class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :subject, :body, :created_at

  def avatar
  end

  def subject
  	object
  end

  def body

   # conversation = current_user.mailbox.conversations.find(params[:id])
   #  receipts = conversation.receipts_for(current_user).page(params[:page]).per(API_PER_PAGE).order('CREATED_AT ASC')#, each_serializer:  EventSerializer
   #  #

  	object
  end


end
