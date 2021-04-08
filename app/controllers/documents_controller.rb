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
    @deadline = @document.deadline.strftime("Expiry: %d %B %Y")
    @reminder = @document.reminder.strftime("Reminder: %d %B %Y")
    @updated_at = @document.updated_at.strftime("Last updated: %d %B %Y")
    @name = @document.name
    @thumb_key = @document.photos.first.key
    @pages = @document.photos.size
    @download_key = @document.photos.last.key
    @tags = @document.types
  end

  def new
    @document = Document.new
    authorize @document
    folders = Folder.all
    @indented_folder_list = generate_array(folders)
  end

  def edit
    @document = Document.find(params[:id])
    authorize @document
    folders = Folder.all
    @indented_folder_list = generate_array(folders)
  end

  def update
    @document = Document.find(params[:id])
    authorize @document
    @document.update(document_params)
    redirect_to @document
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
      folders = Folder.all
      @indented_folder_list = generate_array(folders)
      render :new # il faut render pour afficher le message d'erreur
    end
  end

  def index
    @documents = policy_scope(Document).order(deadline: :asc)
    # search with associations
    if params[:name].present? || params[:type].present?
      sql_query = " \
        documents.name ILIKE :name \
        AND types.name ILIKE :type \
      "
      @documents = Document.joins(:types).joins(:document_types).where(sql_query, type: "%#{params[:type]}%", name: "%#{params[:name]}%")
    else
      @documents = Document.all.take(50)
    end

    @types = policy_scope(Type).order(name: :asc)
  end

  private

  def document_params
    # on doit donner les champs précis car c'est ce qui est passé en paramètre
    params.require(:document).permit(:folder_id, :deadline, :reminder, :name, photos: [])
  end

  def generate_array(folders)
    results = []
    folders.each do |folder|
      if folder.folder_id.nil?
        temp = [folder.name, folder.id]
      else
        temp = ["» #{folder.name}", folder.id]
      end
      results.push(temp)
    end
    results
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
