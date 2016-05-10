module TagHelper

  def show_tags(post)
    if post.all_tags.length != 0
      tags = "tags:" + tag_links(post.all_tags)
      tags.html_safe
    else
      return
    end
  end

  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip)}.join(", ")
  end
end
