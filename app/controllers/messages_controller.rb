class MessagesController < ApplicationController
  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
    #@message_quote = Quote.find(params[:quote_id])
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:notice] = "Account successfully created"
    redirect_to conversation_path(conversation)
  end
end