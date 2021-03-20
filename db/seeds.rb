
# To run this seed, in Terminal type command: rake db:seed:seeds
# To run all seeds, in Terminal type command: rake db:seed:all

puts "Cleaning databases..."


Type.destroy_all
puts "destroy type"
Document.destroy_all
puts "destroy Document"
Folder.destroy_all
puts "destroy folder"
User.destroy_all
puts "destroy user"


puts "Creating users..."

user_1 = User.create(email: "ismael@email.com",  password: "123456", first_name: "FFF", last_name: "LLL", birthdate: "2022-02-15", address: "bbbbbbbbb")
user_2 = User.create(email: "ivan@email.com",  password: "123456", first_name: "FFF", last_name: "LLL", birthdate: "2022-02-15", address: "bbbbbbbbb")
user_3 = User.create(email: "antoine@email.com",  password: "123456", first_name: "FFF", last_name: "LLL", birthdate: "2022-02-15", address: "bbbbbbbbb")

puts "Creating folders..."

folder_1 = Folder.create(name: "Privé")
folder_2 = Folder.create(name: "Ménage")
folder_3 = Folder.create(name: "Professionnel")

folder_4 = Folder.create(name: "Privé level 2", folder_id: folder_1.id)
folder_5 = Folder.create(name: "Ménage level 2", folder_id: folder_2.id)
folder_6 = Folder.create(name: "Professionnel level 2", folder_id: folder_3.id)

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

require 'open-uri'
require 'nokogiri'

# path of images (relative)
images_path = File.expand_path(".", Dir.pwd) + "/app/assets/images/doc_samples"
puts images_path

Dir.glob(images_path + "/*").each do |f|
  filename_wo_extension = File.basename(f, ".pdf")
  puts filename_wo_extension
  filename = File.basename(f)
  puts filename
  filepath = File.path(f)
  puts filepath
  file = File.open(filepath)
  puts file


  document = Document.new(name: "#{filename_wo_extension}", deadline: "2022/02/15", reminder: "2022/02/05", user_id: User.first.id, folder_id: Folder.first.id)
  
  # definition, variable
  first = Hash.new
  first[:key] = "1"
  first[:url] = "https://res.cloudinary.com/ismooz/image/upload/v1615642798/bp4jixnmmbdbwzypmh29.jpg"
  first[:extension] = "image/jpg"
  current = first

  # insertion, fix
  file = URI.open(current[:url])
  document.photos.attach(io: file, filename: "#{filename_wo_extension}_page#{current[:key]}", content_type: current[:extension])
  document.save!

  # definition, variable
  second = Hash.new
  second[:key] = "2"
  second[:url] = "https://res.cloudinary.com/ismooz/image/upload/v1616085330/pw05d3nfn4is22ia0flbjzz1qyd4.png"
  second[:extension] = "image/png"
  current = second

  # insertion, fix
  file = URI.open(current[:url])
  document.photos.attach(io: file, filename: "#{filename_wo_extension}_page#{current[:key]}", content_type: current[:extension])
  document.save!

  Cloudinary::Uploader.upload("#{images_path}/#{filename}",
  :folder => "pdf_samples", :public_id => "#{filename_wo_extension}", :overwrite => true, :resource_type => "auto")

  puts "Created #{document.id}"
end

puts "Documents finished!"
