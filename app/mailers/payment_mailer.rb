class PaymentMailer < ActionMailer::Base
  default from: "from@example.com"

  def payment_email(user, payment)
    @payment = payment.item.kind.name
    mail to: user.email,
    subject: "購入ありがとうございます"
  end
end
