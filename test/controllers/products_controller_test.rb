require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_path

    assert_response :success
    assert_select '.product', 2
  end

  test 'should show a product' do
    get product_path(products(:ps4))

    assert_response :success
  end
end
