class AlbumsController < ApplicationController
  layout 'logged_in'
  before_action :authenticate_user!
  before_action :find_album, only: [:edit, :update, :show, :destroy]  
  def index
    @albums = Album.find_by(params[:profile_id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    @album.profile_id = current_user.profile.id
    if @album.save
      flash[:success]="Created new album. Add some photos!"
      redirect_to profile_path(@album.profile_id)
    else
      flash[:error]= "Something went wrong."
      render :new
    end
  end

  def show
    @album_photos = @album.photos
    @photo = Photo.new
  end

  def edit
  end

  def update
    if @album.update(album_params)
      flash[:success]= "Update successful!"
      redirect_to profile_path(@album.profile_id)
    else
      flash[:error]= "Something went wrong."
      render :edit
    end
  end

  def destroy
    if @album.destroy
      flash[:notice]= "Album destroyed!"
    else
      flash[:error]= "Something went wrong."
    end
    redirect_to profile_path(@album.profile_id)
  end

  private

    def find_album
      @album = Album.find_by(id: params[:id])
    end

    def album_params
      params.require(:album).permit(:album_name, :visual_artist_id, :venue_rep_id, :musician_id, :profile_id)
    end
end
