class MypagesController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_todos, only: [:index, :index_todos]
  before_action :set_information, only: [:index, :index_information]
  before_action :set_under_transaction_items, only: [:index, :index_under_transaction_items]
  before_action :set_sold_out_items, only: [:index, :index_sold_out_items]
  before_action :set_locale
  layout "mypage"

  def index
    @todos = @todos.first(5)
    @information = @information.first(5)
    @under_transaction_items = @under_transaction_items.first(5)
    @sold_out_items = @sold_out_items.first(5)
  end

  def show
    @user = User.find(params[:id])
    @items = @user.sell_items.includes(:pictures)
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

  def index_information
    current_user.information.each do |information|
      information.read!
    end
    @information_length = 0
  end

  def index_todos
  end

  def index_under_transaction_items
    @items = @under_transaction_items
    render :items
  end

  def index_sold_out_items
    @items = @sold_out_items
    render :items
  end

  def index_sell_items
    @items = current_user.sell_items.includes(:pictures).where(transaction_stage: 'under_sale').order(created_at: :desc)
    render :items
  end

  def index_under_transaction_sell_items
    @items = current_user.sell_items.includes(:pictures).where(transaction_stage: ['purchased', 'shipping', 'evaluated']).order(created_at: :desc)
    render :items
  end

  def index_sold_out_sell_items
    @items = current_user.sell_items.includes(:pictures).where(transaction_stage: 'transaction_completed').order(created_at: :desc)
    render :items
  end

  private

  def mypage_params
    params.require(:user).permit(:nickname, :profile)
  end

  def set_todos
    @todos = current_user.todos.order(created_at: :desc).includes(item: :pictures)
  end

  def set_information
    @information = current_user.information.order(created_at: :desc).includes(:stakeholder, [related_item: :pictures])
  end

  def set_under_transaction_items
    @under_transaction_items = current_user.buy_items.includes(:pictures).where(transaction_stage: ['purchased', 'shipping', 'evaluated']).order(created_at: :desc)
  end

  def set_sold_out_items
    @sold_out_items = current_user.buy_items.includes(:pictures).where(transaction_stage: 'transaction_completed').order(created_at: :desc)
  end
end
