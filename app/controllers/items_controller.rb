class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.pictures.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    # binding.pry
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
    # @picture = @item.pictures.new(picture_params)
    # @picture.save
    logger.debug @item.errors.inspect

    # # if @item.save
    # #   redirect_to items_path
    # # end

    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to :index, notice: 'Item was successfully created.' }
    #     format.json { render :root, status: :created, location: @item }
    #   else
    #     format.html { render :index }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # seller_id: current_user.idに変更予定
    def item_params
      params.require(:item).permit(:name, :description, :state, :delivery_payer, :upper_category_id, :delivery_region, :delivery_duration, :buy_price, :commission_price, :sell_price, pictures_attributes: [:content]).merge(size_id: "10",brand_id: "20",middle_category_id: "30",lower_category_id: "40", seller_id: "1")
    end

end
