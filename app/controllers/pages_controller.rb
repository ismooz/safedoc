class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    @documents = Document.where(user: current_user)


    @last_documents = @documents.last(3)

    @doc_by_deadline = @documents.sort_by { |doc| [doc.deadline]}
    @doc_by_deadline = @doc_by_deadline.take(3)

  end
end
