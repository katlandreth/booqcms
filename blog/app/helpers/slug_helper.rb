module SlugHelper
  def path_to_post(post)
    if post.slug && post.slug.length != 0
       post.slug
    else
      post_path(post.id)
    end
  end
end
