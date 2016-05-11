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

  def tag_filter
    entries = Booqcms::Entry.all
    tag_list = Array.new
    entries.each do |entry|
      entry.tags.each do |tag|
        tag_list << tag.name
      end
    end
    # tag_list.group_by(&:capitalize).map{|k, v| [k, v.length]}
    tag_list.group_by(&:capitalize).map{ |tag, count| "#{tag} (#{count.length})" }
  end

end
