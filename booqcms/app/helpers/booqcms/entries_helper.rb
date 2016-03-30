module Booqcms
  module EntriesHelper

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
      if entry.published_at
        "published"
      else
        "draft"
      end
    end
  end
end
