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


    ##SEO Tool

    def count_words(string, exclude = nil)
      @counter = WordsCounted.count(string, exclude: exclude)
    end

    def words_count(string)
      count_words(string)
      @counter.token_count
    end

    def word_frequency(string)
      count_words(string, stop_words)
      @counter.token_frequency
    end

    def word_density(string)
      count_words(string, stop_words)
      @counter.token_density
    end

    def stop_words
      [->(t){t.length < 4 }, "figcaption", "figure", "amazonaws", "https", "booqcms", "class", "inline-image"]
    end
    #
    # def highlight_words(string, word)
    #   highlight(string, word, highlighter: '<span style= "color:red;">\1<em>')
    # end

  end
end
