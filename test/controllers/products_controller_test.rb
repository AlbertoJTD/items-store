require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_path

    assert_response :success
    assert_select '.product', 3
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
        price: 3499,
        category_id: categories(:technology).id
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Tu producto se ha creado correctamente'
  end

  test 'should not create a product with empty fields' do
    post products_path, params: {
      product: {
        title: '',
        description: 'Inalambricos',
        price: 3499,
        category_id: categories(:technology).id
      }
    }

    assert_response :unprocessable_entity
  end

  test 'Should get edit view' do
    get edit_product_path(products(:ps4))

    assert_response :success
    assert_select 'form'
  end

  test 'should update a product' do
    patch product_path(products(:ps4)), params: {
      product: {
        title: 'PS4 FAT',
        description: 'Anio 2015',
        price: 299,
        category_id: categories(:technology).id
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Tu producto ha sido actualizado correctamente'
  end

  test "should not update a product" do
    patch product_path(products(:ps4)), params: {
      product: {
        price: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test 'should delete product' do
    assert_difference('Product.count', -1) do
      delete product_path(products(:ps4))
    end

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Tu producto ha sido eliminado correctamente'
  end
end
