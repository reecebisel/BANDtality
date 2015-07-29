require 'rails_helper'

RSpec.describe User, type: :model do

  context "class methods" do
    describe "relationships" do
      it "has one" do
        should { have_one(:profile) }
      end

      it "has_many" do
        should { have_many(:events) }
        should { have_many(:playlists) }
        should { have_many(:photos) }
      end
    end
  end
end
