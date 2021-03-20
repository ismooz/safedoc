class FoldersController < ApplicationController
  def index
    @folders = policy_scope(Folder) # what does that mean ?
    @folders = Folder.where(parent_id: nil)
    @documents = []
  end

  def show
    # folders to show
    @folders = Folder.where(parent_id: params[:id])
    authorize @folders

    # parent folder
    folder = Folder.find(params[:id])

    # breadcrumb
    breadcrumb = []
    @breadcrumb = generate_breadcrumb(folder, breadcrumb)
    
    # files
    @documents = Document.where(folder_id: params[:id])
    authorize @documents
  end
  
end

