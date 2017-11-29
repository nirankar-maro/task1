class Api::V1::UserController < Api::V1::BaseController
  skip_before_action :authenticate_user
  respond_to :json
  def create
    d = User.new.password_genrator
    @user = User.new(user_params)
    @user.password = d
    @user.password_confirmation =d
    if @user.save
      render json: {Message: "Successful" ,status: "Success"},code: 200

    else
      render json: {Err_msg: @user.errors.full_messages,status: "Failure"},code: 500
    end
  end
  private
  def user_params
    params.require(:user).permit(:email)
  end
end
