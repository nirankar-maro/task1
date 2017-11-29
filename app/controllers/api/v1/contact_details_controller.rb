class Api::V1::ContactDetailsController < Api::V1::BaseController
  skip_before_action :authenticate_user
  respond_to :json
  def create
    @contact_detail = ContactDetail.new(contact_us_params)
    if @contact_detail.save
      @email = ContactEmail.new
      Thread. new{
      @email.thankyou_mail(@contact_detail)
      }
      render json: {Message: "Successful" ,status: "Success"}

    else
      render json: {Err_msg: @contact_detail.errors.full_messages,status: "Failure"}
    end
  end
  private
  def contact_us_params
    params.require(:contact_detail).permit(:name,:email,:mobile_no,:message)
  end
end
