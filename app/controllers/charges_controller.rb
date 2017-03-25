class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user}",
      amount: 1500
    }
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: 1500,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    if charge.paid
      current_user.premium!

      flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
      redirect_to user_path(current_user) # or wherever
    end

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def destroy
    current_user.standard!
    current_user.wikis.each do |wiki|
      wiki.update(private: false)
    end
    redirect_to root_path, notice: 'Successfully downgraded.'
  end
end
