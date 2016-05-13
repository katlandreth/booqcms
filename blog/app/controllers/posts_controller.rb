class PostsController < ApplicationController
  respond_to :html, :json, :js

  def index
    @posts = Post.published.post_type(:tutorial)
  end

  def show
    @post = all_post_types.published.find(params[:id])
  end

  def slug
     @post = all_post_types.published.find_by_slug!(params[:slug])
     render 'show'
  end

  def tutorials
    @posts = Post.published.post_type(params[:post_type])
    respond_with @posts
  end

  def blog
    @posts = Post.published.post_type(params[:post_type])
    respond_with @posts
  end

  def book
  end

  def filter
    @posts = Post.published.tagged_with(params[:tag]).post_type(params[:post_type]).sorted_by(params[:order])
    respond_with @posts
  end

  private

  def all_post_types
    Booqcms::Entry.all.published
  end
end
