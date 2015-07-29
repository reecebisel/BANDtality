require 'rails_helper'

RSpec.describe Event, type: :model do

  context "class methods" do

    describe "relationships" do
      it "belongs to" do
        belong_to(:venue)
        belong_to(:user)
      end

      it "has one" do
        have_one(:address)
      end

      it "has an attached file" do
        have_one(:images)
      end
    end
  end

end