class CategoriesController < ApplicationController
  add_breadcrumb "Home", :root_path
  
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /categories
  # GET /categories.json
  def index
    category_breadcrums({})
    @categories = Category.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    category_breadcrums({"display_text": "Show Category"})
  end

  # GET /categories/new
  def new
    category_breadcrums({"display_text": "New Category"})
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    category_breadcrums({"display_text": "Edit Category"})
  end

  # POST /categories
  # POST /categories.json
  def create
    category_breadcrums({"display_text": "Create Category"})
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    category_breadcrums({"display_text": "Update Category"})
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end

    def category_breadcrums(breadcrums_data)
       add_breadcrumb "Categories", :categories_path
       if breadcrums_data.present?
         add_breadcrumb breadcrums_data[:display_text]
       end
    end
end
