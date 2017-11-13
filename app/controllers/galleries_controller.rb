class GalleriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:edit,:update,:destroy]
  def index
    @gallery = Gallery.new
    @gallery_all = current_user.galleries.page params[:page]
  end

  def create
    @gallery =Gallery.new(gallery_create_params)
    @gallery.user_id = current_user.id
    if @gallery.save
      redirect_to galleries_path,notice: "Image Successfully Uploaded"
    else
      render :index
    end
  end

  def edit
  end
  def update
    if @gallery.update(gallery_create_params)
      redirect_to galleries_path,notice: "Image Edited Successfully"
    else
      render :edit
    end
  end
  def destroy
    @gallery.delete
    redirect_to galleries_path,notice: "Photo Deleted Successfully"

  end

  private
    def gallery_create_params
      params.require(:gallery).permit(:name,:image)
    end
    def set_photo
      @gallery = Gallery.find(params[:id])
    end
end
