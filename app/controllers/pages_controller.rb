class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @document = Document.all.take(3)

    @docu_ddl = @document.sort_by { |doc| [doc.deadline]}

    @docu_ddl = @docu_ddl.take(3)

  end
end
