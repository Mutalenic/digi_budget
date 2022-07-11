class Category < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy_all

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true

  def recent_transactio
    payments.order(created_at: :desc).limit(5)
  end
end
