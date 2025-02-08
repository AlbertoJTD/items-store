# frozen_string_literal: true

class CategoryComponent < ViewComponent::Base
  attr_reader :category

  def initialize(category: nil)
    @category = category
  end

  def title
    category ? category.name : t('.all')
  end

  def link
    category ? products_path(category_id: category.id) : products_path
  end

  def classes
    "category px-2 py-1 rounded-full hover:bg-cyan-300 #{background}"
  end

  def background
    active? ? 'bg-cyan-300' : 'bg-cyan-100'
  end

  def active?
    return true if category.blank? && params[:category_id].blank?

    category&.id == params[:category_id].to_i
  end
end
