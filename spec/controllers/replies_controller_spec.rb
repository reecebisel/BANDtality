require 'rails_helper'

RSpec.describe RepliesController, type: :controller do

let(:reply) {Reply.create(reply_body: 'Hey whats up', message_id: 1)}

 describe "GET #new" do 
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new reply successfully" do
      post :create, reply: {reply_body: 'See you later', message_id: 2}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE #destroy" do
    it "deletes reply successfully" do
      delete :destroy, id: reply.id
      expect(response).to have_http_status(:redirect)
    end
  end

end
