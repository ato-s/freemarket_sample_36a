class LowerCategoriesController < ApplicationController
  before_action :set_lower_category, only: [:show, :edit, :update, :destroy]
  layout "include_breadcrumbs"

  # GET /lower_categories
  # GET /lower_categories.json
  def index
    @lower_categories = LowerCategory.all
  end

  # GET /lower_categories/1
  # GET /lower_categories/1.json
  def show
  end

  # GET /lower_categories/new
  def new
    @lower_category = LowerCategory.new
  end

  # GET /lower_categories/1/edit
  def edit
  end

  # POST /lower_categories
  # POST /lower_categories.json
  def create
    @lower_category = LowerCategory.new(lower_category_params)

    respond_to do |format|
      if @lower_category.save
        format.html { redirect_to @lower_category, notice: 'Lower category was successfully created.' }
        format.json { render :show, status: :created, location: @lower_category }
      else
        format.html { render :new }
        format.json { render json: @lower_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lower_categories/1
  # PATCH/PUT /lower_categories/1.json
  def update
    respond_to do |format|
      if @lower_category.update(lower_category_params)
        format.html { redirect_to @lower_category, notice: 'Lower category was successfully updated.' }
        format.json { render :show, status: :ok, location: @lower_category }
      else
        format.html { render :edit }
        format.json { render json: @lower_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lower_categories/1
  # DELETE /lower_categories/1.json
  def destroy
    @lower_category.destroy
    respond_to do |format|
      format.html { redirect_to lower_categories_url, notice: 'Lower category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lower_category
      @lower_category = LowerCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lower_category_params
      params.fetch(:lower_category, {})
    end
end
