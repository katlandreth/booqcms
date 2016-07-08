module Dashboard
  module EntriesHelper

    def new_entry_path
      dashboard.new_entry_path
    end

    def media_path
      dashboard.media_path
    end


    def grid_item_box(entry)
      render "index_item", entry: entry
    end

    def post_status_class(entry)
      if entry.published_at
        "badge-success"
      else
        "badge-alert"
      end
    end

    def post_status(entry)
      if entry.published_at != nil
        "published"
      else
        "draft"
      end
    end

    def publish_status(entry)
      render 'publish_button'
    end

    def preview_featured_image(entry)
      if entry.featured_image != nil
        return_html = '<img src="' + entry.featured_image + '" width="700" />'
        return_html.html_safe
      else
        '[No Featured Image Set]'
      end
    end

    def tag_links(tags)
      tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip)}.join(", ")
    end

    def seo_analysis(string)
      SeoAnalyzer.new(string)
    end

  end
end
