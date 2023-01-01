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

  test 'should create a new product' do
    post products_path, params: {
      product: {
        title: 'AirPods',
        description: 'Inalambricos',
        price: 3499
      }
    }

    assert_redirected_to products_path
  end

  test 'should not create a product with empty fields' do
    post products_path, params: {
      product: {
        title: '',
        description: 'Inalambricos',
        price: 3499
      }
    }

    assert_response :unprocessable_entity
  end
end
