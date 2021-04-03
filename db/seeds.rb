require 'open-uri'
require 'nokogiri'

Type.destroy_all
Document.destroy_all
Folder.destroy_all
User.destroy_all

puts "Database cleaned!"

user_1 = User.create(email: "ismael@email.com",  password: "123456", first_name: "FFF", last_name: "LLL", birthdate: "2022-02-15", address: "bbbbbbbbb")
user_2 = User.create(email: "ivan@email.com",  password: "123456", first_name: "Ivan", last_name: "Perroud", birthdate: "2022-02-15", address: "Chemin Ritter, Fribourg")
user_3 = User.create(email: "antoine@email.com",  password: "123456", first_name: "FFF", last_name: "LLL", birthdate: "2022-02-15", address: "bbbbbbbbb")
user_ids = User.all.map { |user| user.id }

puts "users finished!"

folder_1 = Folder.create(name: "Private")
Folder.create(name: "Home", folder_id: folder_1.id)
Folder.create(name: "Health", folder_id: folder_1.id)
Folder.create(name: "Car", folder_id: folder_1.id)

folder_2 = Folder.create(name: "Business")
Folder.create(name: "Projects", folder_id: folder_2.id)
Folder.create(name: "Education", folder_id: folder_2.id)

folder_3 = Folder.create(name: "Others")

folder_ids = Folder.all.map { |folder| folder.id }

puts "folders finished!"

types = [{ name: "Contract"},
         { name: "Bill/Warranty"},
         { name: "Certificate"},
         { name: "Identity"},
         { name: "Communication"}]

types.each do |type|
  Type.create!(type)
end

puts "Types finished!"

images_path = File.expand_path(".", Dir.pwd) + "/app/assets/images/doc_samples"
puts images_path

date_1 = "2022/02/15"
date_2 = "2023/07/11"
date_3 = "2024/11/22"

dates = [date_1, date_2, date_3]

Dir.glob(images_path + "/*").each do |f|
  filename_wo_extension = File.basename(f, ".jpg")
  filename = File.basename(f)
  filepath = File.path(f)
  file = File.open(filepath)

  document = Document.new(name: "#{filename_wo_extension}", deadline: dates.sample, reminder: "2022/02/05", user_id: user_ids.sample, folder_id: folder_ids.sample)
  document.photos.attach(io: file, filename: "#{filename_wo_extension}", content_type: "image/jpg")
  document.save!
  puts "Created document id #{document.id}"
end

puts "seed finished!"
