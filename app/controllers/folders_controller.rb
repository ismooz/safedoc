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
  
  private

  # we give a folder object as input. the method stops when Folder object as a nil parent_id
  # in this case we are at the root folder. Recursive function :
  def generate_breadcrumb(folder, arr = [])
    if folder.parent_id.nil?
      arr.unshift(folder)
    else
      # we add current id in first position
      arr.unshift(folder)
      # we get the parent folder
      parent_folder = Folder.find(folder.parent_id)
      # we call the function with parent folder
      generate_breadcrumb(parent_folder, arr)
    end
  end

end
