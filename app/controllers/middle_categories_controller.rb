class MiddleCategoriesController < ApplicationController
  before_action :set_middle_category, only: [:show, :edit, :update, :destroy]

  # GET /middle_categories
  # GET /middle_categories.json
  def index
    @middle_categories = MiddleCategory.all
  end

  # GET /middle_categories/1
  # GET /middle_categories/1.json
  def show
  end

  # GET /middle_categories/new
  def new
    @middle_category = MiddleCategory.new
  end

  # GET /middle_categories/1/edit
  def edit
  end

  # POST /middle_categories
  # POST /middle_categories.json
  def create
    @middle_category = MiddleCategory.new(middle_category_params)

    respond_to do |format|
      if @middle_category.save
        format.html { redirect_to @middle_category, notice: 'Middle category was successfully created.' }
        format.json { render :show, status: :created, location: @middle_category }
      else
        format.html { render :new }
        format.json { render json: @middle_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /middle_categories/1
  # PATCH/PUT /middle_categories/1.json
  def update
    respond_to do |format|
      if @middle_category.update(middle_category_params)
        format.html { redirect_to @middle_category, notice: 'Middle category was successfully updated.' }
        format.json { render :show, status: :ok, location: @middle_category }
      else
        format.html { render :edit }
        format.json { render json: @middle_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /middle_categories/1
  # DELETE /middle_categories/1.json
  def destroy
    @middle_category.destroy
    respond_to do |format|
      format.html { redirect_to middle_categories_url, notice: 'Middle category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_middle_category
      @middle_category = MiddleCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def middle_category_params
      params.fetch(:middle_category, {})
    end
end
