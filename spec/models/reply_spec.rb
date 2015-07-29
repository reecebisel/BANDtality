require 'rails_helper'

RSpec.describe Reply, type: :model do
  context "table relationships" do
    describe "belongs to" do
      it "belongs to" do
        should { belong_to(:profile) }
        should { belong_to(:sender) }
        should { belong_to(:receiver) }
        should { belong_to(:message) }
      end
    end
  end
end
