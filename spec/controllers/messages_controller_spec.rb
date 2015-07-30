require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

let(:message) {Message.create(subject: 'Join my band!')}
 let(:user) {User.create(email: 'test@gmail.com', password: 'password')}

	describe "GET #index" do
		it "returns http success" do
    sign_in(user)
			get :index
	    expect(response).to have_http_status(:success)
	  end
	end

  describe "GET #show" do
    it "returns http success" do
    sign_in(user)
      get :show, id: message.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new message successfully" do
    sign_in(user)
      post :create, message: {subject: 'I want to be in your band.'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do 
    it "returns http success" do
    sign_in(user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "deletes message successfully" do
    sign_in(user)
      delete :destroy, id: message.id
      expect(response).to have_http_status(:redirect)
    end
  end
end
