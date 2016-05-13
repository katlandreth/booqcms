module Booqcms
  class Entry < ActiveRecord::Base
    include Booqcms::MarkdownHelper
    scope :published, -> { where('published_at <= ?', Time.zone.now) }

    has_many :taggings
    has_many :tags, through: :taggings

    # validates :payload, presence: { message: "body can't be blank"}, if: :published_at?
    validates :published_at, absence: { message: "body can't be blank"}, unless: :payload?
    validates :published_at, absence: { message: "featured image can't be blank"}, unless: :featured_image?

    def self.tagged_with(name)
      if name != "all"
        Booqcms::Tag.find_by_name!(name).entries.published
      else
        Entry.published.all
      end
    end

    def self.post_type(*type)
      if type.size > 0
        Booqcms::Entry.where(post_type: type)
      elsif self.count > 0
        self.first[:post_type]
      end
    end

    def all_tags=(names)
      self.tags = names.split(",").map do |name|
        Booqcms::Tag.where(name: name.strip).first_or_create!
      end
    end

    def self.sorted_by(order)
       self.order(:published_at => order)
    end

    def all_tags
      self.tags.map(&:name).join(", ")
    end
  end
end
