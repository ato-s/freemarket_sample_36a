class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]

  def new
    @phone_number = PhoneNumber.new
  end

  def edit
  end

  def create
    @phone_number = PhoneNumber.new(phone_number_params)
    @phone_number.user_id = current_user.id
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

  private
    def set_phone_number
      @phone_number = PhoneNumber.find(params[:id])
    end

    def phone_number_params
      params.require(:phone_number).permit(:number, :verification_code, :verification_code_confirmation, :verified, :user_id)
    end
end
