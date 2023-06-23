class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def create
    author = Author.create!(author_params)
    render json: author, status: :created
  end

  private

  def render_unprocessable_entity(invalid)
    render json: {error: invalid.record.errors}, status: :unprocessable_entity
  end
  def author_params
    params.permit(:name, :phone_number)
  end
end

  
