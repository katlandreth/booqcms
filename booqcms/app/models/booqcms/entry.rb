module Booqcms
  class Entry < ActiveRecord::Base
    include Booqcms::MarkdownHelper
    scope :published, -> { where('published_at <= ?', Time.zone.now) }
  end
end
