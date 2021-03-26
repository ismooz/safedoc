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
    @folders = Folder.where(folder_id: nil)
    @subfolders = Folder.where.not(folder_id: nil)
  end

  def create
    @document = Document.new(document_params)
    authorize @document
    @document.user = current_user
    
    type_ids = params[:document][:type_ids]
    if @document.save
      type_ids.each do |type_id|
        save_doctype(type_id)
      end
      redirect_to @document
    else
      render :new # il faut render pour afficher le message d'erreur
    end
  end

  private

  def document_params
    # on doit donner les champs précis car c'est ce qui est passé en paramètre
    params.require(:document).permit(:folder_id, :deadline, :reminder, :name, photos: [])
  end

  def save_doctype(type_id)
    unless type_id.empty?
      doctype = DocumentType.new
      doctype.document = @document
      doctype.type_id = type_id
      doctype.save
    end
  end

end
