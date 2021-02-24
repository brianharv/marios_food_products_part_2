class ProductsController < ApplicationController
  before_action :authenticate_user!, :except => [:home, :index, :show] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def home
    @products = Product.all.three_most_recent
    render :home
  end

  def index
    @products = Product.order(:name).page(params[:page])
    @products = Product.search_by_name(params[:search_name]) unless params[:search_name].blank?
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "New Product Created Successfully"  #Think about adding string interpolation for product name.
        redirect_to products_path
      else
        flash[:alert] = "There was an error while creating product"
        render :new
      end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
         flash[:notice] = "Product Updated Successfully"
         redirect_to products_path
      else
        flash[:alert] = "There was an error while updating product"
        render :edit
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "This Product has been deleted"
    redirect_to products_path
  end

  def search
    @products = Product.search_by_name(params[:product][:search_name].titleize)
    render :search
  end

  private

  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin, :search_name)
  end
end