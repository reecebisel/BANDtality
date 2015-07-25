module MessagesHelper

  def self.unread_replies
    replies.where(reply_read = true)
  end
end
