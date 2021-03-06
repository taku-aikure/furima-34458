class Item < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area 
  belongs_to :days

  with_options presence: true do
    validates :name, :description, :image, :price
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :cost_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :days_id, numericality: { other_than: 1 }
end
