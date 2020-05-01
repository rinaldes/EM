class Api::V1::MessagesController < Api::V1::BaseController

  def index
    conversations = current_user.mailbox.conversations
    if conversations.present?
      messages = conversations.page(params[:page]).per(API_PER_PAGE)
      expose messages
    else
      expose error! :not_found
    end
  end

  def show
    conversation = current_user.mailbox.conversations.find(params[:id])
    receipts = conversation.receipts_for(current_user).page(params[:page]).per(API_PER_PAGE).order('CREATED_AT ASC')#, each_serializer:  EventSerializer
    if receipts.present?
      expose receipts, each_serializer: MessageSerializer
    else
      expose error! :not_found
    end
  end

  def create
    body = params[:body]
    if params[:conversation_id].present?
      conversation = current_user.mailbox.conversations.find(params[:conversation_id])
      if current_user.reply_to_conversation(conversation, body)
        expose status: 200, conversation_id: conversation.id
      else
         expose error! :not_found
      end
    else
      receipt = User.find(params[:receipt_id])
      subject = receipt.name

      conversation = current_user.mailbox.conversations.where(:subject => subject).first
      if conversation.present?
        conversation = current_user.reply_to_conversation(conversation, body)
      else
        conversation = current_user.send_message(receipt, body, subject)
      end
      if conversation
        expose status: 200, conversation_id: conversation.id
      else
         expose error! :not_found
      end
    end
  end

  def destroy
    conversation = current_user.mailbox.conversations.find(params[:id])
    current_user.mark_as_deleted conversation
  end

end
