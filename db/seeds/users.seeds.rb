ActiveRecord::Base.connection.execute("TRUNCATE users RESTART IDENTITY");
puts "========== Seeding users.. =========="

admin = User.new({
  :email => 'admin@pratesis.com',
  :password => 'adminpassword',
  :password_confirmation => 'adminpassword',
  :created_at => Time.now,
  :updated_at => Time.now,
  :is_admin => true,
  :name => 'Admin',
  :phone => Faker::PhoneNumber.phone_number
})
admin.skip_confirmation!
admin.save

(1..60).each_with_index do |u, index|
  user = User.new
  user.email = Forgery::Internet.email_address
  user.name = Forgery::Name.first_name.downcase
  user.password = Forgery::Basic.password
  user.password_confirmation = user.password
  user.phone = Faker::PhoneNumber.phone_number
  user.is_admin = false
  user.created_at = Time.now
  user.updated_at = Time.now
  user.avatar = File.open("#{Rails.root}/app/assets/images/avatar/avatar-0#{[*1..8].sample}.jpg")
  user.skip_confirmation!
  user.save
end