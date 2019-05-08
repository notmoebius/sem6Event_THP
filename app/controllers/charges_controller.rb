class ChargesController < ApplicationController
  # une fois payé retour sur l'event
  # after_create: faire attendance.create (avec event.id, current_user.id et strip number)
  
  def new
  end
  
  def create
    # Amount in cents
    @amount = params[:amount].to_i * 100
    puts "*" * 60
    puts @amount
    puts "*" * 60

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
  

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
