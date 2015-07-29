require 'rails_helper'

RSpec.describe Musician, type: :model do

  context "class methods" do

    describe "relationships" do
      it "belongs to" do
        should belong_to(:profile)
      end

      it "has many" do
        should have_many(:photos)
        should have_many(:playlists)
        should have_many(:albums)
        should have_many(:addresses)
      end
    end
  end

end