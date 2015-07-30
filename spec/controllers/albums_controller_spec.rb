require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

let(:album) {Album.create(album_name: 'Sweet Riffs')}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: album.id
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST #create" do
    it "creates a new album successfully" do
      post :create, album: {album_name: 'flowers'}
      expect(response).to have_http_status(:redirect)
    end
    # it 'fails to create new musician' do
    #   post :create, musician:{instrument: nil}
    #   expect(flash[:error]).to be_present
    #   expect(response).to render_template(:new)
    # end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit, id: album.id
  #     expect(response).to have_http_status(:redirect)
  #   end
  # end

  # describe "PUT #update" do
  #   it "updates album successfully" do
  #     put :update, id: album.id, album: {album_name: 'Test Album'}
  #     new_album = 'Test Album'
  #     updated_album = album.reload
  #     expect(updated_album.album_name).to eq(new_album)
  #     expect(response).to have_http_status(:redirect)
  #   end
  # end

  describe "DELETE #destroy" do
    it "deletes album successfully" do
      delete :destroy, id: album.id
      expect(response).to have_http_status(:redirect)
    end
  end
end
