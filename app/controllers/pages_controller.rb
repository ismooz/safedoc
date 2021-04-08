class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :pricing, :faq, :gdpr, :about]

  def home

    @documents_sorted_creation = Document.where("user_id = ?", current_user.id).order(created_at: :asc).take(6)
    @documents_sorted_deadline = Document.where("user_id = ?", current_user.id).order(deadline: :asc).take(6)
  end

  def pricing
  end

  def faq
  end

  def gdpr
  end

  def about
  end
end
