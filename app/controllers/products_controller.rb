class ProductsController < ApplicationController
  before_action :set_product, only: %i[destroy show edit update]

  def index
    @categories = Category.order(name: :asc).load_async
    @products = Product.with_attached_photo

    if params[:category_id]
      @products = @products.where(category_id: params[:category_id])
    end

    if params[:min_price].present?
      @products = @products.where("price >= #{params[:min_price]}")
    end

    if params[:max_price].present?
      @products = @products.where("price <= #{params[:max_price]}")
    end

    if params[:query_text].present?
      @products = @products.search_full_text(params[:query_text])
    end

    order_type = Product::ORDER_TYPE.fetch(params[:order_by]&.to_sym, Product::ORDER_TYPE[:newest])

    @products = @products.order(order_type).load_async
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
end
