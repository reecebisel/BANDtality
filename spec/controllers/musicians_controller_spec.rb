require 'rails_helper'

RSpec.describe MusiciansController, type: :controller do

  let(:musician) {Musician.create(instrument: 'Harmonica')}
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
      get :show, id: musician.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new musician successfully" do
      post :create, musician: {instrument: 'banjo'}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #new" do 
    it "returns http success" do
      sign_in(user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "edits musician successfully" do
      sign_in(user)
      get :edit, id: musician.id
      expect(response).to have_http_status(:success)
    end
  end

  # describe "PUT #update" do
  #   it "updates musician successfully" do
  #   # sign_in(user)
  #     put :update, id: musician.id, musician: {instrument: 'harpsichord'}
  #     new_musician = 'harpsichord'
  #     updated_musician = musician.reload
  #     expect(updated_musician.instrument).to eq(new_musician)
  #     expect(response).to have_http_status(:redirect)
  #   end
  #   # it 'fails to update musician' do
  #   #   put :update, id: musician.id, musician: {instrument: nil}
  #   #   expect(flash[:error]).to be_present
  #   #   expect(response).to render_template(:edit)
  #   # end  
  # end

  describe "DELETE #destroy" do
    it "deletes musician successfully" do
      delete :destroy, id: musician.id
      expect(response).to have_http_status(:redirect)
    end
  end
end
