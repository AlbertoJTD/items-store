class ProductsController < ApplicationController
  before_action :set_product, only: %i[destroy show edit update]

  def index
    @products = Product.all.with_attached_photo
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'Tu producto se ha creado correctamente'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: 'Product updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, notice: 'Product deleted'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:description, :price, :title, :photo)
  end
end
