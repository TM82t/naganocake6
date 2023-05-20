class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_detail

  enum payment_method: { credit_card: 1, bank: 2 }

end
