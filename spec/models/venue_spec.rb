require 'rails_helper'

RSpec.describe Venue, type: :model do
  context "table relationships" do
    describe "has many" do
      it "should have many" do
        should { have_many(:addresses) }
      end
    end

    describe "belongs to" do
      it "should belong to" do
        should { belong_to(:event) }
        should { belong_to(:venue_rep) }
      end
    end
  end
end