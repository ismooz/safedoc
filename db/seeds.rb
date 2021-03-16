# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning databases..."


Type.destroy_all
puts "destroy type"
Folder.destroy_all
puts "destroy folder"


Document.destroy_all
puts "destroy Document"
Folder.destroy_all
puts "folder NOT destroyed"

User.destroy_all
puts "destroy user"



require 'open-uri'
require 'nokogiri'

puts "Creating users..."

user_1 = { email: "ismael@email.com",  password: "123456"}
user_2 = { email: "ivan@email.com",  password: "123456"}
user_3 = { email: "antoine@email.com",  password: "123456"}

# [user_1, user_2, user_3].each do |attributes|
#   user = User.create!(attributes)
#   puts "Created #{user.id}"
# end
# puts "Users finished!"



puts "Creating folders..."

folder_1 = { name: "Privé" }
folder_2 = { name: "Ménage" }
folder_3 = { name: "Professionnel" }

folder_4 = { name: "Privé level 2", parent_id: 1 }
folder_5 = { name: "Ménage level 2", parent_id: 2 }
folder_6 = { name: "Professionnel level 2", parent_id: 3 }

[folder_1, folder_2, folder_3, folder_4, folder_5, folder_6].each do |attributes|
  folder = Folder.create!(attributes)
  puts "Created #{folder.id}"
end
puts "Folders finished!"


puts "Creating types..."

type_1 = { name: "Assurance"}
type_2 = { name: "Garantie"}
type_3 = { name: "Contrat"}

[type_1, type_2, type_3].each do |attributes|
  type = Type.create!(attributes)
  puts "Created #{type.id}"
end
puts "Types finished!"


puts "Creating documents..."

# path of images (relative)
# path = File.expand_path(".", Dir.pwd) + "/app/assets/images/doc_samples"

path = File.join(Rails.root, 'app', 'assets', 'images', 'doc_samples')

Dir.glob(path + "/*").each do |f|
   filename_wo_extension = File.basename(f, ".pdf")
   filename = File.basename(f)
   filepath = File.path(f)




#   document = Document.new(name: "assurance vie", deadline: "2022/02/15", reminder: "2022/02/05", user_id: User.first.id, folder_id: Folder.first.id)

  # document.picture.attach(io: file, filename: filename, content_type: "image/pdf")
puts "rrr"
  Cloudinary::Uploader.upload("app/assets/images/doc_samples/#{filename}", :ocr => "adv_ocr")

  puts "#{filename}"

  # Cloudinary::Uploader.upload("sample.pdf",
  # :ocr => "adv_ocr")

end

puts "Documents finished!"















