class MypagesController < ApplicationController
  before_action :move_to_sign_in
  layout "mypage"

  def index
    @items = current_user.sell_items.includes(:pictures, :likes)
  end

  def show
  end

  def edit
  end

  def update
    if current_user.update(mypage_params)
      redirect_to mypages_path, notice: 'Mypage was successfully updated.'
    else
      render :edit
    end
  end

  def logout
  end

  private
    def mypage_params
      params.require(:user).permit(:nickname, :profile)
    end
end
