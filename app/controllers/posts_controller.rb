class PostsController < ApplicationController
  respond_to :html, :json, :js

  def index
    @post_type = :tutorial
    @posts = Post.published.post_type(@post_type).sorted_by('desc')
  end

  def show
    @post = Post.published.find(params[:id])
  end

  def slug
     @post = Post.published.find_by_slug!(params[:slug])
     render 'show'
  end

  def filter
    @post_type = params[:post_type]
    @posts = Post.published.post_type(params[:post_type]).tagged_with(params[:tag]).content_format(params[:content_format]).sorted_by(params[:order])
    respond_with @posts
  end


  private

  def all_post_types
    Dashboard::Entry.all.published
  end
end
