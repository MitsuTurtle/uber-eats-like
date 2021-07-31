# == Schema Information
#
# Table name: line_foods
#
#  id            :integer          not null, primary key
#  food_id       :bigint           not null
#  restaurant_id :bigint           not null
#  order_id      :bigint
#  count         :integer          default(0), not null
#  active        :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class LineFood < ApplicationRecord
  belongs_to :food
  belongs_to :restaurant
  belongs_to :order, optional: true

  validates :count, numericality: { greater_than: 0 }

  scope :active, -> { where(active: true) }
  scope :other_restaurant, -> (picked_restaurant_id) { where.not(restaurant_id: picked_restaurant_id) }

  def total_amount
    food.price * count
  end
end
