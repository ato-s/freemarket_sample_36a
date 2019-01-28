class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update]
  before_action :move_to_sign_in
  before_action :confirm_current_user, only: [:edit, :update]

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to mypages_path, notice: '登録されました'
    else
      render :new
    end
  end

  def update
    if @address.update(address_params)
      redirect_to mypages_path, notice: '更新しました'
    else
      render :edit
    end
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:first_name, :last_name, :first_name_katakana, :last_name_katakana, :postal_code, :prefecture, :city, :address, :building_name, :landline_number).merge(user_id: current_user.id)
    end
    def confirm_current_user
      redirect_to root_path unless current_user == @address.user
    end
end
