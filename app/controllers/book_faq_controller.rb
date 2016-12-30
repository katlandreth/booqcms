class BookFaqController < ApplicationController
  def show
    @post = Post.new(title: "FAQ", featured_image: "#{view_context.image_url('blackandwhite_desk_image.jpg')}")
  end
end
