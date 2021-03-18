
# To run this seed, in Terminal type command: rake db:seed:seeds_documents
# To run all seeds, in Terminal type command: rake db:seed:all

puts "Creating documents..."

require 'open-uri'
require 'nokogiri'

# path of images (relative)
images_path = File.expand_path(".", Dir.pwd) + "/app/assets/images/doc_samples"

Dir.glob(images_path + "/*").each do |f|
  filename_wo_extension = File.basename(f, ".pdf")
  filename = File.basename(f)
  filepath = File.path(f)
  file = File.open(filepath)


  document = Document.new(name: "assurance vie", deadline: "2022/02/15", reminder: "2022/02/05", user_id: User.first.id, folder_id: Folder.first.id)

  # document.picture.attach(io: file, filename: filename, content_type: "image/pdf")

  document.save!

  puts "Created #{document.id}"
end

puts "Documents finished!"
