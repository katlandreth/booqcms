module Booqcms
  class Entry < ActiveRecord::Base
    include Booqcms::MarkdownHelper
    scope :published, -> { where('published_at <= ?', Time.zone.now) }

    # validates :payload, presence: { message: "body can't be blank"}, if: :published_at?
    validates :published_at, absence: { message: "body can't be blank"}, unless: :payload?
  end
end
