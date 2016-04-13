module Booqcms
  class Medium < ActiveRecord::Base
    mount_uploader :file, ImageUploader
  end
end
