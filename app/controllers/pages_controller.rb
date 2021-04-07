class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :pricing, :faq, :gdpr, :about]

  def home
    @documents_sorted_creation = Document.all.order(created_at: :asc).take(4)
    @documents_sorted_deadline = Document.all.order(deadline: :asc).take(4)

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
