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

    def body_placeholder
      "Add body text here.....Schlitz messenger bag roof party, single-origin coffee beard polaroid small
        batch kitsch intelligentsia next level. Single-origin coffee plaid neutra keytar
        bespoke taxidermy chambray craft beer, gentrify bitters asymmetrical vice locavore
        raw denim biodiesel."
    end
  end
end
