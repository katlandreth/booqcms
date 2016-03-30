module Booqcms
  class ApplicationController < ActionController::Base
    
    protect_from_forgery with: :exception

    def content_entries_path
      entries_path(content_class: content_class.classify)
    end
    helper_method :content_entries_path

    def content_entry_path(entry)
      entry_path(entry, content_class: content_class.classify)
    end
    helper_method :content_entry_path
  end
end
