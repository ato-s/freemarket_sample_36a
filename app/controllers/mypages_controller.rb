class MypagesController < ApplicationController
  before_action :set_mypage, only: [:show, :edit, :update]
  before_action :move_to_sign_in
  before_action :confirm_current_user, only: [:edit, :update]
  def index
    @mypages = Mypage.all
  end

  def show
  end

  def edit
  end

  def update
    if @mypage.update(mypage_params)
      redirect_to @mypage, notice: 'Mypage was successfully updated.'
    else
      render :edit
    end
  end

  def logout
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mypage
      @mypage = Mypage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mypage_params
      params.require(:mypage).permit(:profile, :user_id)
    end
    def move_to_sign_in
      redirect_to root_path unless user_signed_in?
    end
    def confirm_current_user
      redirect_to root_path unless current_user == @mypage.user
    end
end
