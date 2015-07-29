require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

 let(:profile) {Profile.create(name: 'Cool Name', bio: 'This is my bio.', phone_number: 555-555-5555)}
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
      get :show, id: profile.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new profile successfully" do
    sign_in(user)
      post :create, profile: {name: 'Profile Name'}
      expect(response).to have_http_status(:success)
    end
    # it 'does not create successfully' do
    #   post :create, profile:{name: nil}
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
    it "edits profile successfully" do
    sign_in(user)
      get :edit, id: profile.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates profile successfully" do
    sign_in(user)
      put :update, id: profile.id, profile: {name: 'Mr. Profile'}
      new_profile = 'Mr. Profile'
      updated_profile = profile.reload
      expect(updated_profile.name).to eq(new_profile)
      expect(response).to have_http_status(:redirect)
    end
    # it 'does not update successfully' do
    #   put :update, id: profile.id, profile:{name: nil}
    #   expect(flash[:error]).to be_present
    #   expect(response).to render_template(:edit)
    # end
  end

  describe "DELETE #destroy" do
    it "deletes profile successfully" do
    sign_in(user)
      delete :destroy, id: profile.id
      expect(response).to have_http_status(:redirect)
    end
  end
end