require 'rails_helper'

RSpec.describe Profile, type: :model do
  
  context "class methods" do
    describe "search for profile" do
      # Figure out how to test the search option
    end
  end

  context "table relationships" do
    describe "relationships" do
      it "belongs to" do
        should belong_to(:user)
      end

      it "has many" do
        should { have_many(:playlists) }
        should { have_many(:albums) }
        should { have_many(:photos) }
        should { have_many(:albums) }
        should { have_many(:replies) }
        should { have_many(:messages) }

      end

      it "has one" do
        should { have_one(:visual_artist) }
        should { have_one(:venue_rep) }
        should { have_one(:musician) }
        should { have_one(:image) }
      end
    end
  end #context table relationships entag

  context "class validations" do
    describe "validations" do
      it "validates presence of name" do
        should { validate_presence_of(:name) }
      end

      it "validates a photo is present" do
        should { validate_presence_of(:image) }
      end
    end #describe validations endtag
  end #context class validations endtag
end