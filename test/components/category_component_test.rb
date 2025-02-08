# frozen_string_literal: true

require "test_helper"

class CategoryComponentTest < ViewComponent::TestCase
  test "should render an empty category" do
    assert_equal(
      %(<a class=\"category px-2 py-1 rounded-full hover:bg-cyan-300 bg-cyan-300\" href=\"/products\">All</a>),
      render_inline(CategoryComponent.new).to_html
    )
  end

  test "should render a category" do
    category = categories(:perfume)
    assert_equal(
      %(<a class=\"category px-2 py-1 rounded-full hover:bg-cyan-300 bg-cyan-100\" href=\"/products?category_id=#{category.id}\">#{category.name}</a>),
      render_inline(CategoryComponent.new(category: category)).to_html
    )
  end
end
