class BlogLink < Booqcms::Entry
  content_attr :url, :string
  content_attr :quote, :text
  content_attr :comment, :text
  content_attr :body, :text
  #
  # validates :url, presence: true
  # validates :quote, presence: true
end
