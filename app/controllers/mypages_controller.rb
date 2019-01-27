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
    if @mypage.update(mypage_params) && current_user.update(user_params)
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
      params.require(:mypage).permit(:profile).merge(user_id: current_user.id)
    end
    def user_params
      params.require(:mypage).require(:user).permit(:nickname)
    end
    def confirm_current_user
      redirect_to root_path unless current_user == @mypage.user
    end
end
