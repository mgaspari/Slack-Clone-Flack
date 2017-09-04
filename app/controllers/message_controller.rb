class MessageController < ApplicationController

  def new
    redirect_to home_path
  end

  def create
    @message = Message.new
    @message.user_id = session[:current_user_id]
    receiver = User.find_by(username: params[:message][:receiver_id].strip)
    @message.receiver_id = receiver.id
    @message.content = params[:message][:content]
    @message.save
    redirect_to home_path
  end

  def show
    @user = User.find(session[:current_user_id])
    if params[:id].class == Fixnum
      @receiver = User.find(params[:id])
    else
      @receiver = User.find(@user.messages.last.receiver.id)
    end
    @messages = []
    sent = @user.messages.select do |message|
      if message.receiver == @receiver
        message
      end
    end
    received = @receiver.messages.select do |message|
      if message.receiver == @user
        message
      end
    end
    @messages << sent
    @messages << received
    @messages = @messages.flatten.sort_by{|message| message.created_at }
  end
end
