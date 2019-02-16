class ReviewsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_item, only: [:new, :create]
  before_action :set_review, only: :show
  before_action :confirm_buyer_or_seller_include_current_user, except: [:index, :show]
  before_action :confirm_transaction_stage_shipping_or_evaluated, except: [:index, :show]
  before_action :confirm_item_appraiser_exist, only: [:new, :create]
  before_action :confirm_buyer_already_create_review, only: [:new, :create]

  def index
    @received_reviews = current_user.received_reviews
    @sent_reviews = current_user.sent_reviews
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      update_user_review_count
      update_transaction_stage
      seller_get_money if @item.transaction_completed?
      redirect_to item_transaction_messages_path(@item), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      if current_user == @item.seller
        @appraisee_id = @item.buyer_id
      else
        @appraisee_id = @item.seller_id
      end
      params.require(:review).permit(:text, :evaluation, :item_id).merge(appraiser_id: current_user.id, appraisee_id: @appraisee_id, item_id: params[:item_id])
    end

    def confirm_item_appraiser_exist
      @item_appraiser_ids = ['dammy']
      @item.reviews.each do |review|
        @item_appraiser_ids << review.appraiser_id
      end
      redirect_to item_transaction_messages_path(@item) if @item_appraiser_ids.include?(current_user.id)
    end

    def confirm_buyer_already_create_review
      if current_user == @item.seller
        redirect_to item_transaction_messages_path(@item) unless @item_appraiser_ids.include?(@item.buyer_id)
      end
    end

    def confirm_transaction_stage_shipping_or_evaluated
      redirect_to item_transaction_messages_path(@item) unless @item.shipping? || @item.evaluated?
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

    def seller_get_money
      @seller_possession_money = current_user.money.to_i
      @seller_possession_money += @item.sell_price.to_i
      current_user.update(money: @seller_possession_money)
    end
end
