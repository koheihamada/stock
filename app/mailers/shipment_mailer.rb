class ShipmentMailer < ActionMailer::Base
  default from: "from@example.com"

  def shipment_email(payment)
    @payment = payment.item.kind.name
    @seller = payment.seller_user_id
    @shop = User.find(@seller)
    mail to: @shop.email, subject: "商品が売れました。"
  end
end
