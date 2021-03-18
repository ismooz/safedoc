puts "Cleaning databases..."


Type.destroy_all
puts "destroy type"

Document.destroy_all
puts "destroy Document"
Folder.destroy_all
puts "folder NOT destroyed"

User.destroy_all
puts "destroy user"




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

# folder_4 = { name: "Privé level 2", parent_id: 1 }
# folder_5 = { name: "Ménage level 2", parent_id: 2 }
# folder_6 = { name: "Professionnel level 2", parent_id: 3 }

folder_4 = { name: "Privé level 2", folder_id: }
puts "...."
folder_5 = { name: "Ménage level 2", folder_id: }
puts "...."
folder_6 = { name: "Professionnel level 2", folder_id: }

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


# To run this seed, in Terminal type command: rake db:seed:seeds
# To run all seeds, in Terminal type command: rake db:seed:all

puts "Cleaning databases..."

# DocumentType.destroy_all
Folder.destroy_all
User.destroy_all
Type.destroy_all
