# ## Schema Information
#
# Table name: `posts`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`id`**            | `integer`          | `not null, primary key`
# **`user_id`**       | `integer`          |
# **`post_content`**  | `text`             |
# **`created_at`**    | `datetime`         |
# **`updated_at`**    | `datetime`         |
# **`hiring`**        | `boolean`          | `default(FALSE)`
# **`promote`**       | `boolean`          | `default(FALSE)`
# **`launch`**        | `boolean`          | `default(FALSE)`
# **`tools`**         | `boolean`          | `default(FALSE)`
# **`request`**       | `boolean`          | `default(FALSE)`
# **`event`**         | `boolean`          | `default(FALSE)`
#
# ### Indexes
#
# * `index_posts_on_user_id`:
#     * **`user_id`**
#

  require "rails_helper"



  describe User, :type => :model do
    it "orders by last name" do
      lindeman = User.create!(first_name: "Andy", last_name: "Lindeman")
      chelimsky = User.create!(first_name: "David", last_name: "Chelimsky")

      expect(User.ordered_by_last_name).to eq([chelimsky, lindeman])
    end
  end
