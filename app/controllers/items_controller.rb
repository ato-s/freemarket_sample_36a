class ItemsController < ApplicationController
  protect_from_forgery except: [:dynamic_upper_category, :dynamic_middle_category, :dynamic_lower_category]
  before_action :set_locale
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_new_item, only: [:new, :dynamic_upper_category, :dynamic_middle_category, :dynamic_lower_category]
  before_action :move_to_sign_in, except: [:index, :show, :dynamic_upper_category, :dynamic_middle_category, :dynamic_lower_category]
  before_action :delete_pictures, only: [:update]


  def dynamic_upper_category
    @middle_categories = MiddleCategory.where(upper_category_params)
  end

  def dynamic_middle_category
    @lower_categories = LowerCategory.where(middle_category_params)
  end

  def dynamic_lower_category
    @sizes = LowerCategory.find(params[:item][:lower_category_id]).middle_category.size_type.sizes
  end

  def index
    @pickup_categories = UpperCategory.find(1, 2, 3, 7)
    @brand_categories = Brand.find(2443, 6146, 6762, 3806)
  end

  def show
    @seller = @item.seller
    @other_items = @seller.sell_items
    @other_brand_items = Item.where(brand_id: @item.brand_id)
    @brand = @item.brand
    @upper_category = @item.upper_category
    @middle_category = @item.middle_category
    @lower_category = @item.lower_category
    @size = @item.size
    # random_page_link
    @likes = @item.likes
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def new
    10.times { @item.pictures.build }
    @upper_categories = UpperCategory.all.includes([middle_categories: :lower_categories])
  end

  def edit
    (10 - @item.pictures.length ).times { @item.pictures.build }
    @upper_categories = UpperCategory.all.includes([middle_categories: :lower_categories])
    @middle_categories = MiddleCategory.where(upper_category_id: @item.upper_category_id)
    @lower_categories = LowerCategory.where(middle_category_id: @item.middle_category_id)
    @sizes = Size.where(size_type_id: @item.middle_category.size_type_id)
  end

  def create
    @item = Item.new(item_create_params)
    if @item.save
      redirect_to root_path, notice: 'Item was successfully saved.'
    else
      render :new
    end
  end

  def update
    @originally_price = @item.buy_price
    if @item.update(item_params)
      @changed_price = @item.buy_price
      @liker_ids = @item.user_ids
      @information_type = 'be_discounted'
      create_information if @liker_ids.present? && @originally_price != @changed_price
      redirect_to root_path, notice: 'Item was successfully updated.'
    else
      redirect_to edit_item_path(@item)
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, notice: 'Item was successfully destroyed.'
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def set_new_item
      @item = Item.new
    end

    def item_create_params
      params.require(:item).permit(
        :name,
        :description,
        :state,
        :delivery_payer,
        :delivery_region,
        :delivery_duration,
        :buy_price,
        :commission_price,
        :sell_price,
        :like_count,
        :size_id,
        :brand_id,
        :upper_category_id,
        :middle_category_id,
        :lower_category_id,
        :seller_id,
        pictures_attributes: [:id, :content, :status]
      ).merge(transaction_stage: 'under_sale', seller_id: current_user.id)
    end

    def item_params
      params.require(:item).permit(
        :name,
        :description,
        :state,
        :delivery_payer,
        :delivery_region,
        :delivery_duration,
        :buy_price,
        :commission_price,
        :sell_price,
        :like_count,
        :brand_id,
        :seller_id,
        pictures_attributes: [:id, :content, :status]
      ).merge(upper_category_id: 1, middle_category_id: 1, lower_category_id: 1, size_id: 1)
    end

    def upper_category_params
      params.require(:item).permit(:upper_category_id)
    end

    def middle_category_params
      params.require(:item).permit(:middle_category_id)
    end

    def delete_pictures
      pictures = @item.pictures.all
      params_ids = []
      i = 0

      while true
        params_id = params[:item][:pictures_attributes][:"#{i}"]
        if params_id == nil
          break
        end
        params_ids.push(params_id)
        i += 1
      end

      j = 0
      params_ids_ver_i = []

      while j < params_ids.length
        params_ids_ver_i << params_ids[j][:id].to_i
        j += 1
      end

      delete_ids = @item.pictures.ids

      params_ids_ver_i.each do |num|
        delete_ids.delete(num) if delete_ids.include?(num)
      end

      delete_ids.each do |dId|
        Picture.find(dId).delete
      end
    end

    # def random_page_link
    #   #ランダムなページリンクを生成する
    #   rand_ranges = Item.all.count
    #   random = Random.new
    #   @rand_next = random.rand(rand_ranges)+1
    #   @next_page = Item.find(@rand_next)
    #   @rand_prev = random.rand(rand_ranges)+1
    #   @prev_page = Item.find(@rand_prev)
    # end

end
