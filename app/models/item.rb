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
    validates :name, :description, :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :area_id
    validates :days_id
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:  10000000},
  format: {with: /\A[0-9]+\z/}
end
