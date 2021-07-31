# == Schema Information
#
# Table name: foods
#
#  id            :integer          not null, primary key
#  restaurant_id :bigint           not null
#  name          :string           not null
#  price         :integer          not null
#  description   :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Food < ApplicationRecord
  belongs_to :restaurant
  # belongs_to :order, optional: true
  has_one :line_food
end
