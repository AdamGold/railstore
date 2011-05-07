class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  def create
    if status == 'Completed'
      PaymentNotification.create!(:params => params, :item_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    end
  end
end
