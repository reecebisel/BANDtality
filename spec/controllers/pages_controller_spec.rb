require 'rails_helper'

RSpec.describe PagesController, type: :controller do

let(:user) {User.create(email: 'test@gmail.com', password: 'password')}

describe "GET #choose_profile" do
		it "returns http success" do
      sign_in(user)
			get :choose_profile
	    expect(response).to have_http_status(:success)
	  end
	end

describe "GET #founders" do
		it "returns http success" do
      sign_in(user)
			get :founders
	    expect(response).to have_http_status(:success)
	  end
	end

describe "GET #settings" do
		it "returns http success" do
      sign_in(user)
			get :settings
	    expect(response).to have_http_status(:success)
	  end
	end

end
