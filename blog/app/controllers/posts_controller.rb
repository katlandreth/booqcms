class PostsController < ApplicationController
  def index
    # @posts = all_post_types.published.order('published_at DESC')
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

  private

  def all_post_types
    Booqcms::Entry.all.published
  end
end
