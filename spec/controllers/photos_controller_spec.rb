require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

let(:photo) {Photo.create(caption: 'My favorite shows')}
let(:user) {User.create(email: 'test@gmail.com', password: 'password')}


  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

 describe "GET #show" do
    it "returns http success" do
      sign_in(user)
      get :show, id: photo.id
      expect(:image).to be_present
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in(user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "POST #create" do
  #   it "creates a new photo successfully" do
  #     post :create, photo: {caption: 'Rob Zombie'}
  #     expect(response).to have_http_status(:redirect)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit, id: photo.id
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "DELETE #destroy" do
    it "deletes photo successfully" do
      sign_in(user)
      delete :destroy, id: photo.id
      expect(response).to have_http_status(:redirect)
    end
  end

end