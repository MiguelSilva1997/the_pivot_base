module StripeTool

  def self.create_customer(email: email, source: stripeToken)
    Stripe::Customer.create(
      :email => email,
      :source  => source
    )
  end

  def self.create_charge(customer_id: customer_id, amount: amount, description: description)
    Stripe::Charge.create(
      :customer    => customer_id,
      :amount      => amount,
      :description => description,
      :currency    => 'usd'
    )
  end
end
