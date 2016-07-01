module Dashboard
  class Entry < ActiveRecord::Base
    include Dashboard::MarkdownHelper
    # scope :published, -> { where('published_at <= ?', Time.zone.now) }

    has_drafts
    has_many :taggings
    has_many :tags, through: :taggings

    validates :published_at, absence: { message: "body can't be blank"}, unless: :payload?
    validates :published_at, absence: { message: "featured image can't be blank"}, unless: :featured_image?

    def self.tagged_with(name)
      if name != "all"
        Dashboard::Tag.find_by_name!(name).entries.published
      else
        Entry.published.all
      end
    end

    def self.post_type(*type)
      if type.size > 0
        Dashboard::Entry.where(post_type: type)
      elsif self.count > 0
        self.first[:post_type]
      end
    end

    def all_tags=(names)
      self.tags = names.split(",").map do |name|
        Dashboard::Tag.where(name: name.strip).first_or_create!
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
