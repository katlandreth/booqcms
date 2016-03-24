module Booqcms
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def content_entries_path
      entries_path(content_class: content_class.tableize)
    end
    helper_method :content_entries_path
  end
end
