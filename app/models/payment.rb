class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 1000000 }
  validates :user_id, presence: true
end
