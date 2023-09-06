# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  price       :integer          not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  index_products_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B'
  }

  ORDER_TYPE = {
    newest: 'created_at DESC',
    expensive: 'price DESC',
    cheapest: 'price ASC'
  }.freeze

  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  has_many :favorites, dependent: :destroy
  belongs_to :category
  belongs_to :user, default: -> { Current.user }

  def owner?
    user_id == Current.user&.id
  end
end
