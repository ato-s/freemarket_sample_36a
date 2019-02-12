class MypagesController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_todos, only: [:show, :index_todos]
  before_action :set_information, only: [:show, :index_information]
  before_action :set_under_transaction_items, only: [:show, :index_under_transaction_items]
  before_action :set_sold_out_items, only: [:show, :index_sold_out_items]
  layout "mypage"

  def index
    @items = current_user.sell_items.includes(:pictures, :likes)
  end

  def show
    @todos = @todos.first(5)
    @information = @information.first(5)
    @under_transaction_items = @under_transaction_items.first(5)
    @sold_out_items = @sold_out_items.first(5)
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
  end
  def index_sold_out_items
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
