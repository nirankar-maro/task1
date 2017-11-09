class ContactDetailsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contact_detail = ContactDetail.new
  end

  def create
    @contact_us = ContactDetail.new(contact_us_params)
    if @contact_us.save
      redirect_to contact_details_path,notice: "Thanks for Contact Us"
    else
      render :index
    end
  end
  private
  def contact_us_params
    params.require(:contact_detail).permit(:name,:email,:mobile_no,:message)
  end
end
