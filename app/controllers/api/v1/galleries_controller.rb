class Api::V1::GalleriesController < Api::V1::BaseController
  respond_to :json

  def index
    @gallery= @user.galleries

    if @gallery.present?
      @gal_data_array =[]

      @gallery.each do |gallery|
        @gal_data= {}
        @gal_data[:name] = gallery.name
        @gal_data[:image] =  Rails.application.secrets.my_mac_url + gallery.image_url
        @gal_data_array << @gal_data
      end
      render json: {Message: "Successful" ,data: @gal_data_array,status: "Success"},code: 200
    else
      render json: {Err_msg: "No Image is available",status: "Failure"},code: 500
    end
  end

  def create
    @gallery =Gallery.new(gallery_create_params)
    @gallery.user_id = @user.id
    if @gallery.save
      render json: {Message: "Successful" ,status: "Success"},code: 200
    else
      render json: {Err_msg: @gallery.errors.full_messages,status: "Failure"},code:500
    end
  end
  private
  def gallery_create_params
    params.require(:gallery).permit(:name,:image)
  end
end
