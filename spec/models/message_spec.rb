require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:each) do
    @profile1 = Profile.create(name: "James Waler Mcfadden")
    @profile2 = Profile.create(name: "Edwardo Santiago")
      @message1 = Message.create(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: @profile1.id, message_receiver_id: @profile2.id, message_sender_id: @profile1.id, reply_read: true)
      @message2 = Message.create(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: @profile2.id, message_receiver_id: @profile1.id, message_sender_id: @profile2.id, reply_read: false)
      @message3 = Message.create(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: @profile2.id, message_receiver_id: @profile1.id, message_sender_id: @profile2.id, reply_read: true)
      @message4 = Message.create(subject: "Shalome", message_body: "Hey there, how you doing?", profile_id: @profile1.id, message_receiver_id: @profile2.id, message_sender_id: @profile1.id, reply_read: false)
    end
  
  context "Class methods" do
    describe "my_messages" do
      it "finds a profiles messages" do
        expect(Message.all.my_messages(@profile1.id)).to eq([@message2, @message3])
      end

      # not totally sure that i need to check for the failure
      it "fails to find profile messages" do 
        
        expect(Message.all.my_messages(@profile1.id)).to_not eq([@message1, @message4])
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

