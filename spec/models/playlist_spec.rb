require 'rails_helper'

RSpec.describe Playlist, type: :model do

  context "class methods" do
    
    describe "relationships" do
      
      it "belongs to" do
        should { belong_to(:user) }
        should { belong_to(:profile) }
        should { belong_to(:visual_artist) }
        should { belong_to(:musician) }
        should { belong_to(:venue_rep) }
      end

    end

  end

end