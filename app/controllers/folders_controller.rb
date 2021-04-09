class FoldersController < ApplicationController

   before_action :set_user_documents, only: [:show]

  def index
    @folders = policy_scope(Folder) # what does that mean ?
    @folders = Folder.where(folder_id: nil)
    @documents = []
  end

  def show
    # folders to show
    @folders = Folder.where(folder_id: params[:id])
    authorize @folders

    # parent folder
    folder = Folder.find(params[:id])

    # breadcrumb
    breadcrumb = []
    @breadcrumb = generate_breadcrumb(folder, breadcrumb)

    # files
    @documents = @user_documents.where(folder_id: params[:id])
    authorize @documents
  end

end

