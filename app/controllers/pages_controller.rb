class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :pricing]

  def home

    @document = Document.all.take(3)

    @docu_ddl = @document.sort_by { |doc| [doc.deadline]}

    @docu_ddl = @docu_ddl.take(3)

    @documents_sorted_creation = Document.all.order(created_at: :asc).take(3)
    @documents_sorted_deadline = Document.all.order(deadline: :asc).take(3)

  end

  def pricing
  end

  def faq

  end

  def gdpr

  end
end
