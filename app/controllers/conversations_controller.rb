class ConversationsController < ApplicationController
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @unread_messages = @mailbox.inbox(unread: true).count
    @conversations = @mailbox.inbox(page: params[:page], per_page: 10)
  end

  def show
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  private

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end
end