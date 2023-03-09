class ProductsController < ApplicationController
  before_action :set_product, only: %i[destroy show edit update]
  skip_before_action :protect_pages, only: %i[index show]

  def index
    @categories = Category.order(name: :asc).load_async
    @pagy, @products = pagy_countless(SearchProducts.new.call(search_products_params).load_async, items: 12)
  end

  def new
    @product = Product.new
    @categories = Category.all.order(name: :asc)
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit
    @categories = Category.all.order(name: :asc)
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, notice: t('.destroyed')
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:description, :price, :title, :photo, :category_id)
  end

  def search_products_params
    params.permit(:category_id, :min_price, :max_price, :query_text, :order_by)
  end
end
