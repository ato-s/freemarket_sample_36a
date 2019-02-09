class ItemsController < ApplicationController
  protect_from_forgery except: [:dynamic_upper_category, :dynamic_middle_category, :dynamic_lower_category]
  before_action :set_locale
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_new_item, only: [:new, :dynamic_upper_category, :dynamic_middle_category, :dynamic_lower_category]
  before_action :move_to_sign_in, except: [:index, :show, :dynamic_upper_category, :dynamic_middle_category, :dynamic_lower_category]

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
    @items = Item.all.includes(:pictures)
  end

  def show
    @item = Item.includes(:transaction_messages).find(params[:id])
    @seller = User.find(@item.seller_id)
    @other_items = Item.where(seller_id: @item.seller_id)
    @other_brand_items = Item.where(brand_id: @item.brand_id)
    @brand = Brand.find(@item.brand_id)
    @upper_category = UpperCategory.find(@item.upper_category_id)
    @middle_category = MiddleCategory.find(@item.middle_category_id)
    @lower_category = LowerCategory.find(@item.lower_category_id)
    @sizes = Size.find(@item.size_id)
    random_page_link
    @likes = Like.where(item_id: params[:item_id])
  end

  def new
    @upper_categories = UpperCategory.all.includes([middle_categories: :lower_categories])
  end

  def edit
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
    if @item.update(item_params)
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
        :size_id,
        :brand_id,
        :upper_category_id,
        :middle_category_id,
        :lower_category_id,
        :seller_id,
        pictures_attributes: [:id, :content, :status]
      )
    end
    def upper_category_params
      params.require(:item).permit(:upper_category_id)
    end
    def middle_category_params
      params.require(:item).permit(:middle_category_id)
    end

  def random_page_link
    #ランダムなページリンクを生成する
    rand_ranges = Item.all.count
    random = Random.new
    @rand_next = random.rand(rand_ranges)+1
    @next_page = Item.find(@rand_next)
    @rand_prev = random.rand(rand_ranges)+1
    @prev_page = Item.find(@rand_prev)
  end

end
