module TagHelper

  def show_tags(post)
    if post.all_tags.length != 0
      tags = "tags:" + " " + post.all_tags
      tags.html_safe
    else
      return
    end
  end

  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip)}.join(", ")
  end

  def tag_filter(post_type)
    entries = posts_of_type(post_type) #Dashboard::Entry.where(post_type: post_type)
    tag_list = ["All"]
    entries.each do |entry|
      entry.tags.each do |tag|
        tag_list << tag.name
      end
    end
    tag_list.group_by(&:downcase).map do |tag|
      if tag.first == "all"
        ["all (#{posts_of_type(post_type).count})", "all"]
      else
        ["#{tag.first} (#{count_all_posts_of_category(tag)})", tag.first]
     end
   end
  end

  def posts_of_type(post_type)
    Dashboard::Entry.where(post_type: post_type)
  end

  def count_all_posts_of_category(tag)
    tag.second.count
  end

  def count_all_posts_of_format(format, post_type)
    posts_of_type(post_type).where(content_format: format).count
  end
end
