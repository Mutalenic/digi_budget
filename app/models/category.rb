class Category < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true

  def recent_transactions
    payments.order(created_at: :desc).limit(5)
  end
end
