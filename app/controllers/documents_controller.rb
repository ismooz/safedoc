class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
    authorize @document

    # parent folder
    folder = Folder.find(@document.folder_id)

    # breadcrumb
    breadcrumb = []
    @breadcrumb = generate_breadcrumb(folder, breadcrumb)

    # doc infos
    @deadline = @document.deadline
    @updated_at = @document.updated_at.strftime("Last updated: %d %B %Y")
    @name = @document.name
    @thumb_key = @document.photos.first.key
    @pages = @document.photos.size
    @download_key = @document.photos.last.key
  end

  def new
    @document = Document.new
    authorize @document
    @types = Type.all.order('name ASC')
  end

  def create
    @document = Document.new(document_params) # pquoi ça marche alors que ce n'est pas un string
    authorize @document

    if @document.save
      redirect_to @document
    else
      render :new # il faut render pour afficher le message d'erreur
    end
  end

  private

  def document_params
    params.require(:document).permit(:folder, :types, :deadline, :reminder, :photos, :name)
  end

end