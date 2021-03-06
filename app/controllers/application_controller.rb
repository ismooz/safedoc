class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?


  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthdate, :address, :profile_image, :chk_box_validation])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthdate, :address, :profile_image])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

    # we give a folder object as input. the method stops when Folder object as a nil parent_id
  # in this case we are at the root folder. Recursive function :
  def generate_breadcrumb(folder, arr = [])
    if folder.folder_id.nil?
      arr.unshift(folder)
    else
      # we add current id in first position
      arr.unshift(folder)
      # we get the parent folder
      parent_folder = Folder.find(folder.folder_id)
      # we call the function with parent folder
      generate_breadcrumb(parent_folder, arr)
    end
  end

  def set_user_documents
    @user_documents = Document.where(user: current_user)
  end

end
