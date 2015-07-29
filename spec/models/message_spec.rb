require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:each) do
    @profile = Profile.find_by(id: 6)
      @message1 = Message.new(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: 7, message_receiver_id: 6, message_sender_id: 7, reply_read: true)
      @message2 = Message.new(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: 6, message_receiver_id: 4, message_sender_id: 6, reply_read: false)
      @message3 = Message.new(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: 6, message_receiver_id: 4, message_sender_id: 6, reply_read: true)
      @message4 = Message.new(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: 7, message_receiver_id: 6, message_sender_id: 7, reply_read: false)
    end
  
  context "Class methods" do
    describe "my_messages" do
      it "finds a profiles messages" do
        expect(Message.all.my_messages(@profile.id)).to eq([@message1, @message2])
      end

      # not totally sure that i need to check for the failure
      it "fails to find profile messages" do 
        expect(Message.all.my_messages(@profile.id)).to_not eq([@message1, @message2])
      end
    end

    describe "sent_messages" do
      it "finds profile's sent messages" do
        expect(Message.all.sent_messages(@profile.id)).to eq([@message2, @message3])
      end
    end
  end # Class Methods context endtag

  context "relationships" do 
    describe "belongs_to" do
      it "should belong to a profile" do
        should { belong_to :profile }
      end

      it "doesn't belong to a profile" do 
      end

      it "belongs_to a :sender" do
        should { belong_to(:sender) }
      end

      it "belongs_to :receiver" do
        should { belong_to(:receiver) }
      end
    end #describe belongs to endtag

    describe "has_many" do
      it "has many replies" do
        should { have_many(:replies) }
      end
    end
  end #relationships context endtag
end #Rspec describe endtag

# need to stub an Active Record Proxy to get test to work. Should ask JAKE Source about this in the morning

