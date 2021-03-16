class UsersController < ApplicationController
  params.require(:user).permit(:first_name, :last_name, :birthdate, :address, :profile_image)
end
