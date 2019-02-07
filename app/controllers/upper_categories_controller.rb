class UpperCategoriesController < ApplicationController
  before_action :set_upper_category, only: [:show, :edit, :update, :destroy]
  layout "include_breadcrumbs"

  def index
  end

  def show
    @items = @upper_category.items.order("created_at DESC").page(params[:page]).per(80)
    @upper_category_navi = @upper_category.middle_categories.order("RAND()").limit(9)
  end

  # GET /upper_categories/new
  def new
    @upper_category = UpperCategory.new
  end

  # GET /upper_categories/1/edit
  def edit
  end

  # POST /upper_categories
  # POST /upper_categories.json
  def create
    @upper_category = UpperCategory.new(upper_category_params)

    respond_to do |format|
      if @upper_category.save
        format.html { redirect_to @upper_category, notice: 'Upper category was successfully created.' }
        format.json { render :show, status: :created, location: @upper_category }
      else
        format.html { render :new }
        format.json { render json: @upper_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upper_categories/1
  # PATCH/PUT /upper_categories/1.json
  def update
    respond_to do |format|
      if @upper_category.update(upper_category_params)
        format.html { redirect_to @upper_category, notice: 'Upper category was successfully updated.' }
        format.json { render :show, status: :ok, location: @upper_category }
      else
        format.html { render :edit }
        format.json { render json: @upper_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upper_categories/1
  # DELETE /upper_categories/1.json
  def destroy
    @upper_category.destroy
    respond_to do |format|
      format.html { redirect_to upper_categories_url, notice: 'Upper category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upper_category
      @upper_category = UpperCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upper_category_params
      params.fetch(:upper_category, {})
    end
end
