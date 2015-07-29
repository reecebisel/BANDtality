require 'rails_helper'

RSpec.describe EventsController, type: :controller do

 let(:event) {Event.create(event_name: 'Big Crazy Music Festival')}
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
      get :show, id: event.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new event successfully" do
      post :create, event: {event_name: 'Test Event'}
      expect(response).to have_http_status(:redirect)
    end
    # it 'does not create successfully' do
    #   post :create, event:{event_name: nil}
    #   expect(flash[:error]).to be_present
    #   expect(response).to render_template(:new)
    # end
  end

  describe "GET #new" do 
    it "returns http success" do
    sign_in(user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "edits event successfully" do
    sign_in(user)
      get :edit, id: event.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates event successfully" do
    sign_in(user)
      put :update, id: event.id, event: {event_name: 'Test Event'}
      new_event = 'Test Event'
      updated_event = event.reload
      expect(updated_event.event_name).to eq(new_event)
      expect(response).to have_http_status(:redirect)
    end
    # it 'does not update successfully' do
    #   put :update, id: event.id, event:{street: nil}
    #   expect(flash[:error]).to be_present
    #   expect(response).to render_template(:edit)
    # end
  end

  describe "DELETE #destroy" do
    it "deletes event successfully" do
      delete :destroy, id: event.id
      expect(response).to have_http_status(:redirect)
    end
  end
end