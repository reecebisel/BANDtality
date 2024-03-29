class MessagesController < ApplicationController

  layout 'logged_in'
  before_action :find_message, only: [:show, :destroy]
  # before_action :find_last_reply, only: [:index]
  
  def index
    profile_id = current_user.profile.id
    @messages = Message.my_messages(profile_id).order("created_at DESC")
    @unread = @messages.where(reply_read: false).order("created_at DESC")
    @read = @messages.where(reply_read: true).order("created_at DESC")
    @sent_messages = Message.sent_messages(profile_id).order("created_at DESC")
    # raise "the roof"
  end

  def show
    @message.reply_read = true
    @message.save
    @message.reload
    @replies = @message.replies
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.message_sender_id = current_user.profile.id
    if @message.save
      flash[:success]= "Message sent!"
      redirect_to messages_path
    else
      flash[:error]= "Something went wrong!"
      render :new
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path
  end

  private
    def find_message
      @message = Message.find_by(id: params[:id])
    end

    def message_params
      params.require(:message).permit(:subject, :message_body, :message_receiver_id)
    end

    def find_last_reply
      @last_reply = @message.replies.last
    end
end
