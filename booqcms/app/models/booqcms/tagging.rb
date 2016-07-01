module Dashboard
  class Tagging < ActiveRecord::Base
    belongs_to :entry, :class_name => "Dashboard::Entry"
    belongs_to :tag, :class_name => "Dashboard::Tag"
  end
end
