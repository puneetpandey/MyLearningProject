class Post < ActiveRecord::Base
  validates :title, presence: true

  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses

  scope :shipping_address, -> { joins(:addresses).where("addresses.address_type = ?", 'Shipping') }
  scope :billing_address, -> { joins(:addresses).where("addresses.address_type = ?", 'Billing') }
end
