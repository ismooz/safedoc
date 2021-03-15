class FoldersController < ApplicationController
  def index
    @folders = policy_scope(Folder)
  end

  def show
    @folder = Folder.find(params[:id])
    authorize @folder
  end
  
end
