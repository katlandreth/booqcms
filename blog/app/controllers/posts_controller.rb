class PostsController < ApplicationController
  def index
    @posts = blog_posts_with_links.published.order('id desc')
  end

  def show
    @post = blog_posts_with_links.published.find_by_slug!(params[:slug])
  end

  private

  def blog_posts_with_links
    Booqcms::Entry.where(type: %w(BlogPost BlogLink)).published
end
