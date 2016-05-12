class PostsController < ApplicationController
  respond_to :html, :json, :js

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all.published
    end
  end

  def show
    @post = all_post_types.published.find(params[:id])
  end

  def slug
     @post = all_post_types.published.find_by_slug!(params[:slug])
     render 'show'
  end

  def filter
    if params[:tag] && params[:tag] != "all"
      @posts = Post.tagged_with(params[:tag])
      respond_with @posts
    else
      @posts = Post.all.published
      respond_with @posts
    end
  end

  private

  def all_post_types
    Booqcms::Entry.all.published
  end
end
