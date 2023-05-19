class Order < ApplicationRecord
  enum payment_method: { credit_card: 1, bank: 2 }

end
