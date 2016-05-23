module Booqcms
  class Tagging < ActiveRecord::Base
    belongs_to :entry, :class_name => "Booqcms::Entry"
    belongs_to :tag, :class_name => "Booqcms::Tag"
  end
end
