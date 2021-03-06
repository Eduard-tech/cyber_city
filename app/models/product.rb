class Product < ApplicationRecord
  CATEGORIES = [
    'Software-Security',
    'GDPR-compliance',
    'Web-Application-Firewall',
    'HTTP-Headers-Security',
    'Content-Security-Policy',
    'Others'
  ]
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :cart_products
  has_many :carts, through: :cart_products
  has_many :order_products
  has_many :orders, through: :order_products
  has_many_attached :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  monetize :price_cents

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: {
      name: 'A',
      description: 'B'
    },
    using: {
      tsearch: { prefix: true }
    }
end
