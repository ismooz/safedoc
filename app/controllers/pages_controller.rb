class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @document = Document.all.take(3)

    docu_ddl = @document.sort_by { |doc| [doc.deadline]}

    @document_per_deadline = docu_ddl.take(3)



    # @ddl =[]

    # @ddl << @deadlines

    # @documentByDeadline = Document.deadline


   # @document = Document.find(params[:id])
   #  authorize @document



    # doc infos
     # @deadline = @document.deadline
    # @updated_at = @document.updated_at.strftime("Last updated: %d %B %Y")
    # @name = @document.name
    # @thumb_key = @document.photos.first.key
    # @pages = @document.photos.size
    # @download_key = @document.photos.last.key

  end
end
