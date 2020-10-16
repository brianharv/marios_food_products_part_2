class ProductsController < ApplicationController

  def home
    @products = Product.all
    render :home
  end  

  def index 
    @products = Product.all
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

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end  
end  