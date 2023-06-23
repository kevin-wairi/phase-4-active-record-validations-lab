class PostsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def create
    post = Post.create!(post_params) 
    render json: post, status: :created   
  end

  private

  def render_unprocessable_entity(invalid)
    render json: {error: invalid.record.erros },status: :unprocessable_entity
  end

  def post_params
    params.permit(:title,:content,:summary,:category)
  end

end

