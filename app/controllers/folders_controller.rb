class FoldersController < ApplicationController
  def index
    @folders = policy_scope(Folder) # what does that mean ?
    @folders = Folder.where(parent_id: nil)
    @documents = []
  end

  def show
    @folders = Folder.where(parent_id: params[:id])
    authorize @folders
    # files
    @documents = Document.where(folder_id: params[:id])
    authorize @documents
  end
  
end
