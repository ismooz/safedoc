class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :pricing, :faq, :gdpr, :about]
  before_action :set_user_documents, only: [:home]

  def home
    @documents_sorted_creation = @user_documents.order(created_at: :asc).take(6)
    @documents_sorted_deadline = @user_documents.order(deadline: :asc).take(6)
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
