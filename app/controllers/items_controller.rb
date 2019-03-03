class ItemsController < ApplicationController
  protect_from_forgery except: [:dynamic_upper_category, :dynamic_middle_category, :dynamic_lower_category]
  before_action :set_locale
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_new_item, only: [:new, :dynamic_upper_category, :dynamic_middle_category, :dynamic_lower_category]
  before_action :set_params, only: [:update]
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
    @likes = @item.likes
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    if Item.any?
      random_page_link
    end
  end

  def new
    10.times { @item.pictures.build }
    render :new, layout: "single"
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
    @item = Item.new(item_params)
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

  def search
    @items = Item.where("name LIKE(?) OR description LIKE(?)","%#{params[:keyword]}%", "%#{params[:keyword]}%").order("created_at DESC").page(params[:page]).per(48).includes(:pictures)
    @new_items = Item.order("created_at DESC").limit(24).includes(:pictures)
    render :search, layout: "search"
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def set_new_item
      @item = Item.new
    end

    def set_params
      i = 0
      while true
        if params[:item][:pictures_attributes][:"#{i}"] == nil
          break
        else
          if params[:item][:pictures_attributes][:"#{i}"][:id] != nil
            if params[:item][:pictures_attributes][:"#{i}"][:trriming_x] != nil
              if Rails.env.development? || Rails.env.test?
                params[:item][:pictures_attributes][:"#{i}"] = params[:item][:pictures_attributes][:"#{i}"].merge(content: open("public" + params[:item][:pictures_attributes][:"#{i}"][:status]))
              elsif Rails.env.production?
                params[:item][:pictures_attributes][:"#{i}"] = params[:item][:pictures_attributes][:"#{i}"].merge(content: open(params[:item][:pictures_attributes][:"#{i}"][:status]))
              end
            end
          end
          i += 1
        end
      end
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
        pictures_attributes: [:id,
                              :trriming_x,
                              :trriming_y,
                              :trriming_width,
                              :trriming_height,
                              :content,
                              :status]
      ).merge(transaction_stage: 'under_sale', seller_id: current_user.id)
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

     def random_page_link
       @next_page = Item.order("RAND()").limit(1).first
       @prev_page = Item.order("RAND()").limit(1).first
     end

end
