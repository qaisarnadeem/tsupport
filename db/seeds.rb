# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'highline/import'

def get_password(prompt="Enter Password")
  ask(prompt) {|q| q.echo = false}
end
email = ''
while(email.length <= 0)
  email = ask("Please enter admin user email")
end
password = '';
while(password.length <= 0)
  password = get_password()
end
user = User.find_or_initialize_by(email: email.chomp)
user.password = password
user.role = 'admin'
user.name = "Admin"
puts (user.save ? "Admin user created for email: #{email}" : "Could not create admin user , errors: #{user.errors.messages}")