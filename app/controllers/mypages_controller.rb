class MypagesController < ApplicationController
  before_action :set_mypage, only: [:index, :show, :edit, :update]
  before_action :move_to_sign_in
  before_action :confirm_current_user, only: [:edit, :update]
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
      redirect_to @mypage, notice: 'Mypage was successfully updated.'
    else
      render :edit
    end
  end

  def logout
  end

  private
    def set_mypage
      @mypage = current_user.mypage
    end
    def mypage_params
      params.require(:user).permit(:nickname, mypage_attributes: [:profile, :id])
    end
    def confirm_current_user
      redirect_to root_path unless current_user == @mypage.user
    end
end
