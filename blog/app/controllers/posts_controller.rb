class PostsController < ApplicationController
  def index
    @posts = all_post_types.published.order('id desc')
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
