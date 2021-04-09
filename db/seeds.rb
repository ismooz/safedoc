require 'open-uri'
require 'nokogiri'
require 'json'

Type.destroy_all
Document.destroy_all
Folder.destroy_all
User.destroy_all

puts "Database cleaned!"

user_1 = User.create(email: "is.gashi@gmail.com",  password: "is.gashi@gmail.com", first_name: "Ismaël", last_name: "Gashi", birthdate: "1983-11-17", address: "Route de Saint-Aubin 70, 1565 Missy", chk_box_validation: true)
user_2 = User.create(email: "ivan@email.com",  password: "123456", first_name: "Ivan", last_name: "Perroud", birthdate: "2022-02-15", address: "Chemin Ritter, Fribourg", chk_box_validation: true)
user_3 = User.create(email: "antoine@email.com",  password: "123456", first_name: "FFF", last_name: "LLL", birthdate: "2022-02-15", address: "bbbbbbbbb", chk_box_validation: true)
user_ids = User.all.map { |user| user.id }

puts "users finished!"

folder_1 = Folder.create(name: "Personnal")
Folder.create(name: "Admin", folder_id: folder_1.id)
Folder.create(name: "Education", folder_id: folder_1.id)
Folder.create(name: "Family", folder_id: folder_1.id)
Folder.create(name: "Identity", folder_id: folder_1.id)
Folder.create(name: "Health", folder_id: folder_1.id)
Folder.create(name: "Work", folder_id: folder_1.id)
Folder.create(name: "Insurance", folder_id: folder_1.id)

folder_2 = Folder.create(name: "Home")
Folder.create(name: "Energie", folder_id: folder_2.id)
Folder.create(name: "Household", folder_id: folder_2.id)
Folder.create(name: "Renovation", folder_id: folder_2.id)
Folder.create(name: "Other", folder_id: folder_2.id)

folder_3 = Folder.create(name: "Communication")
Folder.create(name: "Internet", folder_id: folder_3.id)
Folder.create(name: "Phone", folder_id: folder_3.id)
Folder.create(name: "TV", folder_id: folder_3.id)

folder_4 = Folder.create(name: "Insurance")
Folder.create(name: "Accident", folder_id: folder_4.id)
Folder.create(name: "Animals", folder_id: folder_4.id)
Folder.create(name: "House", folder_id: folder_4.id)
Folder.create(name: "Disability", folder_id: folder_4.id)
Folder.create(name: "Health", folder_id: folder_4.id)
Folder.create(name: "Legal", folder_id: folder_4.id)
Folder.create(name: "Life", folder_id: folder_4.id)
Folder.create(name: "Personnal liability", folder_id: folder_4.id)
Folder.create(name: "Travel", folder_id: folder_4.id)
Folder.create(name: "Vehicles", folder_id: folder_4.id)

folder_5 = Folder.create(name: "Banking")
Folder.create(name: "Account", folder_id: folder_5.id)
Folder.create(name: "Mortgage", folder_id: folder_5.id)
Folder.create(name: "Savings", folder_id: folder_5.id)

folder_6 = Folder.create(name: "Other")
Folder.create(name: "Purchases", folder_id: folder_6.id)
Folder.create(name: "Subscription", folder_id: folder_6.id)
Folder.create(name: "Sport", folder_id: folder_6.id)
Folder.create(name: "Travel", folder_id: folder_6.id)
Folder.create(name: "User manuals", folder_id: folder_6.id)

folder_6 = Folder.create(name: "Taxes")


folder_ids = Folder.all.map { |folder| folder.id }

puts "folders finished!"

types = [{ name: "Contract"},
         { name: "Bill"},
         { name: "Receipt"},
         { name: "Certificate"},
         { name: "Attestation"},
         { name: "Warranty"},
         { name: "Identity"},
         { name: "User manual"},
         { name: "Communication"},
         { name: "Form"},
         { name: "Other"},
        ]

types.each do |type|
  Type.create!(type)
end

puts "Types finished!"

doc_samples_path = File.expand_path(".", Dir.pwd) + "/app/assets/images/doc_samples"
file_path = doc_samples_path + "/data.json"

serialized_documents = File.read(file_path)
documents = JSON.parse(serialized_documents)

documents.each do |document|
  # metadata
  d = Document.new
  d.name = document["name"]

  document["deadline"] == "" ? d.deadline = "31/12/2025" : d.deadline = document["deadline"]
  document["reminder"] == "" ? d.reminder = "31/10/2025" : d.reminder = document["reminder"]

  d.user = user_1 # we choose a random user...
  folder_name = document["folder"].split("/").last
  folder = Folder.where(name: folder_name).first
  d.folder = folder

  # attachment
  image_path = doc_samples_path + "/" + document["filename"]
  file = File.open(image_path)
  d.photos.attach(io: file, filename: document["filename"], content_type: "image/jpg")
  d.save!

  # type
  type = Type.where(name: document["type"]).first
  dt = DocumentType.new
  dt.document = d
  dt.type = type
  dt.save!

  puts "document #{d.name} saved"
end

puts "seed finished!"
