class PhotosController < ApplicationController

  before_action :authenticate_user!
  before_action :find_photo, only: [:edit, :update, :show, :destroy]

  # def index
  #   @photos = Photo.all
  # end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.album_id = params[:photo][:album_id]
    @photo.user_id = current_user.id
    if @photo.save
      flash[:success]= "Photo created!"
      redirect_to album_path(@photo.album_id)
    else
      flash[:error]= "Photo failed to create!"
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   if @photo.update(photo_params)
  #     flash[:success]= "Photo updated!"
  #     redirect_to profile_path(@photo.profile_id)
  #   else
  #     flash[:error]= "Photo failed to update!"
  #     render :edit
  #   end
  # end

  def show
  end

  def destroy
    @photo.destroy
    redirect_to album_path(@photo.album_id)
  end

  private

  def find_photo
    @photo = Photo.find_by_id(params[:id])
    unless @photo
      render(text: "We couldn't find the photo you wanted.", status: :not_found)
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image, :profile_id, :album_id)
  end
end
