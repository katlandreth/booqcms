module Booqcms
  class Entry < ActiveRecord::Base
    include Booqcms::MarkdownHelper
    scope :published, -> { where('published_at <= ?', Time.zone.now) }

    has_many :taggings
    has_many :tags, through: :taggings

    # validates :payload, presence: { message: "body can't be blank"}, if: :published_at?
    validates :published_at, absence: { message: "body can't be blank"}, unless: :payload?
    validates :published_at, absence: { message: "featured image can't be blank"}, unless: :featured_image?

    def all_tags=(names)
      self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
      end
    end

    def all_tags
      self.tags.map(&:name).join(", ")
    end
  end
end
