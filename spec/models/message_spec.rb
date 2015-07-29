require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:each) do
    @profile = Profile.find_by(id: 6)
      @message1 = Message.create(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: 7, message_receiver_id: 6, message_sender_id: 7, reply_read: true)
      @message2 = Message.create(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: 6, message_receiver_id: 4, message_sender_id: 6, reply_read: false)
      @message3 = Message.create(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: 6, message_receiver_id: 4, message_sender_id: 6, reply_read: true)
      @message4 = Message.create(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: 7, message_receiver_id: 6, message_sender_id: 7, reply_read: false)
    end
  
  context ".message methods" do
    describe "self.my_messages" do
      it "finds a profiles messages" do
        expect(Message.all.my_messages(@message1.message_receiver_id)).to eq(@message1 && @message2)
        # Message.my_messages(@message1.message_receiver_id)
      end
    end
  end
end
