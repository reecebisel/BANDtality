require 'rails_helper'

RSpec.describe VisualArtist, type: :model do
  context "table relationships" do
    describe "belongs to" do
      it "should belong to" do
        should { belong_to(:profile) }
      end
    end

    describe "has many" do
      it "should have many" do
        should { have_many(:photos) }
        should { have_many(:albums) }
        should { have_many(:addresses) }
        should { have_many(:playlists) }
      end
    end
  end
end