module Booqcms
  module EntriesHelper

    def new_entry_path
      booqcms.new_entry_path
    end

    # def entries_path(class_name)
    #   booqcms.entries_path(content_class: class_name)
    # end

    def media_path
      booqcms.media_path
    end


    def grid_item_box(entry)
      render "grid_item_content", entry: entry
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
      # if entry.published_at != nil
      #   render 'published_notice'
      # else
        render 'publish_button'
      # end
    end

    def edit_post_content(entry)
      # if entry.published_at != nil
      #   render 'edit_post_disabled'
      # else
        render 'edit_post_enabled'
      # end
    end


    def attr_placeholder(attr_name, attr_type)
      placeholder_map = { :string => "Should be about one line.",
        :text => "This can be a lot more text like this: Schlitz messenger bag roof party, single-origin coffee beard polaroid small batch kitsch intelligentsia next level. ",
        :date => "It should be a date", :boolean => "It should be a checkbox" }

      "Add <strong>#{attr_name}</strong> content here. #{placeholder_map[attr_type]}"
    end

    def attr_type_to_input(attr_type)
      input_map = {:string => :input, :text => :textarea, :date => :date, :boolean => :checkbox}
      input_map[attr_type]
    end

    def preview_featured_image(entry)
      if entry.featured_image != nil
        return_html = '<img src="' + entry.featured_image + '" width="700" />'
        return_html.html_safe
      else
        '[No Featured Image Set]'
      end
    end
  end
end
