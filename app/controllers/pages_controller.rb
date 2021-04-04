class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :pricing]

  def home
    @documents_sorted_creation = Document.all.order(created_at: :asc).take(3)
    @documents_sorted_deadline = Document.all.order(deadline: :asc).take(3)
  end

  def pricing
  end
end
