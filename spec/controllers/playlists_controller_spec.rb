require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do

 let(:playlist) {Playlist.create(playlist_url: 'url')}
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
      get :show, id: playlist.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new playlist successfully" do
    sign_in(user)
      post :create, playlist: {playlist_url: 'Test.url'}
      expect(:playlist).to have_http_status(:redirect)
    end
  end

  describe "GET #new" do 
    it "returns http success" do
    sign_in(user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #edit" do
  #   it "edits playlist successfully" do
  #   sign_in(user)
  #     get :edit, id: playlist.id
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "PUT #update" do
  #   it "updates playlist successfully" do
  #   sign_in(user)
  #     put :update, id: playlist.id, playlist: {playlist_url: 'random.url'}
  #     new_playlist = 'random.url'
  #     updated_playlist = playlist.reload
  #     expect(updated_playlist.playlist_url).to eq(new_playlist)
  #     expect(response).to have_http_status(:redirect)
  #   end
  # end

  describe "DELETE #destroy" do
    it "deletes playlist successfully" do
      delete :destroy, id: playlist.id
      expect(response).to have_http_status(:redirect)
    end
  end
end