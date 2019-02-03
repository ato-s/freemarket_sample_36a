class ReviewsController < ApplicationController
  before_action :set_item, only: [:new, :edit, :create, :update]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :confirm_transaction_stage_under_transaction, except: [:index, :show]
  before_action :confirm_item_appraiser_existence_and_item_buyer_already_create_review, only: [:new, :create]
  after_action :update_transaction_stage_to_sold_out, only: :create

  def index
    @recieved_reviews = current_user.received_reviews
    @sent_reviews = current_user.sent_reviews
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    if @review = Review.create(review_params)
      redirect_to mypages_path, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @review = Review.update(review_params)
      redirect_to mypages_path, notice: 'Review was successfully created.'
    else
      render :edit
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end
    def set_item
      @item = Item.find(params[:item_id])
    end

    def review_params
      if current_user == @item.seller
        @appraisee_id = @item.buyer_id
      else
        @appraisee_id = @item.seller_id
      end
      params.require(:review).permit(:text, :evaluation, :item_id).merge(appraiser_id: current_user.id, appraisee_id: @appraisee_id, item_id: params[:item_id])
    end
    def confirm_transaction_stage_under_transaction
      redirect_to mypages_path unless @item.transaction_stage == 'under_transaction'
    end
    def confirm_item_appraiser_existence_and_item_buyer_already_create_review
      @item_appraiser_ids = ['dammy']
      @item.reviews.each do |review|
        @item_appraiser_ids << review.appraiser_id
      end
      redirect_to mypages_path if @item_appraiser_ids.include?(current_user.id)
      if current_user == @item.seller
        redirect_to mypages_path unless @item_appraiser_ids.include?(@item.buyer_id)
      end
    end
    def update_transaction_stage_to_sold_out
      if @item.reviews.length == 0
        #create todo
      elsif @item.reviews.length == 1
        @item.update(transaction_stage: 'sold_out')
      end
    end
end
