class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :last_4_digits
      t.string :stripe_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
