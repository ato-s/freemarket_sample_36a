class ReviewsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_item, only: [:new, :edit, :create, :update]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :confirm_buyer_or_seller_include_current_user, except: [:index, :show]
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
      update_user_review_count
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
    def update_user_review_count
      @appraisee = @review.appraisee
      @good_count = @appraisee.good_count
      @normal_count = @appraisee.normal_count
      @bad_count = @appraisee.bad_count
      if @review.evaluation == 'good'
        @good_count += 1
      elsif @review.evaluation == 'normal'
        @normal_count += 1
      else
        @bad_count += 1
      end
      @appraisee.update(good_count: @good_count, normal_count: @normal_count, bad_count: @bad_count)
    end
end
