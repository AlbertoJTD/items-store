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

  test 'should render a form for product' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end
end
