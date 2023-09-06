require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @ps4 = products(:ps4)
    @nvidia = products(:nvidia)
  end

  test 'should create favorite' do
    assert_difference('Favorite.count', 1) do
      post favorites_url(product_id: @ps4.id)
    end

    assert_redirected_to product_path(@ps4)
  end

  test 'should remove favorite' do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(@nvidia.id)
    end

    assert_redirected_to product_path(@nvidia)
  end
end
