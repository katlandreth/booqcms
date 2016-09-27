module Dashboard
  class Entry < ActiveRecord::Base
    include Dashboard::MarkdownHelper

    has_drafts
    has_many :taggings
    has_many :tags, through: :taggings

    validates :published_at, absence: { message: "body can't be blank"}, unless: :payload?
    validates :published_at, absence: { message: "featured image can't be blank"}, unless: :featured_image?

    # def published
    #   Dashboard::Entry.published
    # end

    def self.tagged_with(name)
      if name != "all"
        joins(:tags).where("name = ?", name )
      else
        all
      end
    end

    def self.post_type(type = 'tutorial')
      if type.size > 0
        self.where(post_type: type)
      elsif self.count > 0
        self.first[:post_type]
      end
    end

    def self.content_format(c_format = 'all')
      if c_format != "all"
        where(content_format: c_format)
      else
        all
      end
    end

    def self.sorted_by(order)
       self.order(:published_at => order)
    end

    def all_tags=(names)
      self.tags = names.split(",").map do |name|
        Dashboard::Tag.where(name: name.strip).first_or_create!
      end
    end

    def all_tags
      self.tags.map(&:name).join(", ")
    end
  end
end
