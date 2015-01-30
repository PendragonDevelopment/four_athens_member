class SubscriptionsController < ApplicationController
  def index
  end

  def new
  	@subscription = Subscription.new

  end

  def create
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
      new_card = customer.cards.create(:card => params[:stripe_token])
      customer.default_card = new_card.id
      if new_card.save
        if customer.save
        flash[:notice] = "Your card was updated and your subscription was created successfully. Welcome back!" 
      else
        flash[:notice] = "Your card updated was unsuccessful. Please contact the administrator.... i.e. Jim Flannery"
        end
      else
        flash[:notice] = "Your card updated was unsuccessful. Please contact the administrator.... i.e. Jim Flannery"
      end

      stripe_sub = customer.subscriptions.create(:plan => STRIPE_PLAN_NAME)
      rails_sub = Subscription.new(
		    :last_4_digits => params[:last_4_digits], 
		    :user_id => current_user.id, 
		  	:stripe_id => stripe_sub.id
		  )  
      rails_sub.save
      member = current_user
      member.role = "member"
      member.save
  	
  	redirect_to :root
  end


  def update_card

	customer = Stripe::Customer.retrieve(current_user.stripe_id)
	old_card_id = customer.default_card
	old_card = customer.cards.retrieve(old_card_id)

	new_card = customer.cards.create(:card => params[:stripe_token])
		customer.default_card = new_card.id
		if new_card.save
		  if customer.save
			flash[:notice] = "Your card was updated."
			sub = current_user.subscription
				sub.last_4_digits = params[:last_4_digits]
			sub.save
			old_card.delete
		  else
			flash[:notice] = "Your card updated was unsuccessful. Please contact the administrator.... i.e. Jim Flannery"
		  end
		else
			flash[:notice] = "Your card updated was unsuccessful. Please contact the administrator.... i.e. Jim Flannery"
		end
	redirect_to :back
  end

    def subscription_update_params
    params.require(:subscription).permit()
  end
end
