module Booqcms
  class Medium < ActiveRecord::Base
    mount_uploader :file, Booqcms::ImageUploader
  end
end
