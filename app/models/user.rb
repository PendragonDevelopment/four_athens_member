class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_mentionable

  after_create :create_profile
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :sheets, dependent: :destroy
  has_many :slots #don't destroy but definitely will remove the id from the slot
  has_and_belongs_to_many :skills
  has_one :profile, dependent: :destroy
  has_one :subscription, dependent: :destroy

  ROLES = %i[member mentor admin locked]


  def create_profile
  	self.build_profile
  	self.profile.save
  end

  def self.check_stripe_for_email(email)
    stripe_customers = Stripe::Customer.all
    emails = stripe_customers[:data].collect { |customer| customer[:email] }
    emails.include?(email)
  end

end

# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `integer`          | `not null, primary key`
# **`first_name`**              | `string(255)`      |
# **`last_name`**               | `string(255)`      |
# **`created_at`**              | `datetime`         |
# **`updated_at`**              | `datetime`         |
# **`admin`**                   | `boolean`          | `default(FALSE)`
# **`email`**                   | `string(255)`      | `default(""), not null`
# **`encrypted_password`**      | `string(255)`      | `default(""), not null`
# **`reset_password_token`**    | `string(255)`      |
# **`reset_password_sent_at`**  | `datetime`         |
# **`remember_created_at`**     | `datetime`         |
# **`sign_in_count`**           | `integer`          | `default(0), not null`
# **`current_sign_in_at`**      | `datetime`         |
# **`last_sign_in_at`**         | `datetime`         |
# **`current_sign_in_ip`**      | `string(255)`      |
# **`last_sign_in_ip`**         | `string(255)`      |
# **`role`**                    | `string(255)`      | `default("member")`
# **`stripe_id`**               | `string(255)`      |
#
# ### Indexes
#
# * `index_users_on_reset_password_token` (_unique_):
#     * **`reset_password_token`**
#
