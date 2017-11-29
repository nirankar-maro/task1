class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user
  respond_to :json
  private
  def authenticate_user
    email = params[:email]
    password = params[:password]
    @user = User.find_by(email: email)
    if @user.present?
      if password != nil
        if @user.valid_password?(password)
        else
          render json: {Err_msg: "Email or Password is Invalid",status: "Failure"}
        end
      else
        render json: {Err_msg: "Password is Invalid",status: "Failure"}
      end
    else
      render json: {Err_msg: "Email is Invalid",status: "Failure"}
    end
  end

end