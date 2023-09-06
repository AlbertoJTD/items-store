class FavoritesController < ApplicationController
  def create
    Favorite.create(product: product, user: Curremt.user)
  end

  private

  def product
    @product ||= Product.find(params[:product_id])
  end
end
