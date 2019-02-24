class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]
  before_action :phone_params, only: [:create]

  def new
    @phone_number = PhoneNumber.new
  end

  def edit
  end

  def create
    @phone_number = PhoneNumber.new(phone_params)
    # @phone_number.user_id = current_user.id
    if @phone_number.save
      redirect_to root_path, notice: 'Phone number was successfully created.'
    else
      render :new
    end
  end

  def update
    if @phone_number.update(phone_number_params)
      redirect_to root_path, notice: 'Phone number was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @phone = Phone.new(phone_params)
    user_id = params[:user_id]
    if @phone.save
      phone_id = @phone.id
      redirect_to user_phone_verification_input_path(user_id,phone_id)
    end
  end

  def verification_input
  end

  def verification
    @phone = Phone.find(params[:phone_id])
    @phone.verification_code_confirmation = params[:verification_code_confirmation]
    if @phone.verified_true
      redirect_to users_path
    else
      redirect_to user_phone_verification_input_path
    end
  end


  private
  def phone_params
    params.require(:phone).permit(:number).merge(user_id: 1)
  end

  def set_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end

end
