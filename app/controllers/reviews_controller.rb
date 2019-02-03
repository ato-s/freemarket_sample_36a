class ReviewsController < ApplicationController
  before_action :set_item, only: [:new, :edit, :create, :update]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

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
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @review = Review.update(review_params)
      redirect_to @review, notice: 'Review was successfully created.'
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
end
