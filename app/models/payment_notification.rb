class PaymentNotification < ActiveRecord::Base
  attr_accessible :params, :item_id, :status, :transaction_id
  belongs_to :item
  serialize :params
end
