# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skill_list = [
	"html + css",
	"javascript",
	"php",
	"Objective C",
	"Ruby/Rails",
	"Scala",
	"iOS",
	"Android",
	"SQL",
	"SEO",
	"Marketing",
	"Sales",
	"Legal",
	"Operations"
]

skill_list.each do |skill|
	Skill.create( skill_name: skill)
end
