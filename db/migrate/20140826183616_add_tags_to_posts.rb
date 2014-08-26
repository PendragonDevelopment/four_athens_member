class AddTagsToPosts < ActiveRecord::Migration
  def change
  	add_column("posts", "hiring", :boolean, :default => false)
  	add_column("posts", "promote", :boolean, :default => false)
  	add_column("posts", "launch", :boolean, :default => false)
  	add_column("posts", "tools", :boolean, :default => false)
  	add_column("posts", "request", :boolean, :default => false)
  	add_column("posts", "event", :boolean, :default => false)
  end
end
