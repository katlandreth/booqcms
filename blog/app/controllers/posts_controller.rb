class PostsController < ApplicationController
  def index
    @posts = all_post_types.published.order('id desc')
  end

  def show
    @post = all_post_types.published.find_by_slug!(params[:slug])
  end

  private

  def all_post_types
    Booqcms::Entry.where(type: %w(BlogPost Marketing)).published
  end
end
