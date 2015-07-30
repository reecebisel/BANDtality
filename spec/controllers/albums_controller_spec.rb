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

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: album.id
      expect(response).to have_http_status(:redirect)
    end
  end

  def update
    if @album.update(album_params)
      flash[:notice] = "Album updated!"
      redirect_to album_path(@album.id)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :edit
    end
  end



end
