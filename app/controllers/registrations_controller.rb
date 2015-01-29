
class RegistrationsController < Devise::RegistrationsController



  def create
	  super  
	  if resource.save
		  customer = Stripe::Customer.create(
			  :description => "#{resource.first_name} #{resource.last_name}",
			  :card => params[:stripe_token],
			  :email => resource.email
		  )
		  sub = customer.subscriptions.create(:plan => STRIPE_PLAN_NAME)
		  @subscription = Subscription.new(
		  	  :last_4_digits => params[:last_4_digits], 
		  	  :user_id => resource.id, 
		  	  :stripe_id => sub.id
		  )
		  
		  if @subscription.save
		  	resource.stripe_id = customer.id
		  	if resource.save
		  		flash[:notice] = "Welcome to Four Athens!"
		  	else
		  		flash[:notice] = "There was an error with subscription. Please contact the administrator.... i.e. Jim Flannery"
		  	end
	  	  else
	  	    resource.role = "locked"
	  	  	resource.save
	  	  	flash[:notice] = "The subscription was unsuccessful. Please contact the administrator.... i.e. Jim Flannery"
	  	  end
	  end
  end

  def edit 	
  	customer = Stripe::Customer.retrieve(current_user.stripe_id)
		if customer.default_card
		  card_id = customer.default_card
		  card = customer.cards.retrieve(card_id)
			@last4 = card.last4
			@exp_month = card.exp_month
			@exp_year = card.exp_year
			@brand = card.brand
		end
  end

  def update
  	super
  end

 
  private
 
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :company, :last_4_digits, :stripe_token)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :last_4_digits, :stripe_token)
  end
end