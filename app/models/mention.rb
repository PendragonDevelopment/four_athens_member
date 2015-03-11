class Mention < Socialization::ActiveRecordStores::Mention
end

# ## Schema Information
#
# Table name: `mentions`
#
# ### Columns
#
# Name                    | Type               | Attributes
# ----------------------- | ------------------ | ---------------------------
# **`id`**                | `integer`          | `not null, primary key`
# **`mentioner_type`**    | `string(255)`      |
# **`mentioner_id`**      | `integer`          |
# **`mentionable_type`**  | `string(255)`      |
# **`mentionable_id`**    | `integer`          |
# **`created_at`**        | `datetime`         |
#
# ### Indexes
#
# * `fk_mentionables`:
#     * **`mentionable_id`**
#     * **`mentionable_type`**
# * `fk_mentions`:
#     * **`mentioner_id`**
#     * **`mentioner_type`**
#
