module Booqcms
  class Medium < ActiveRecord::Base
    mount_uploader :image, ImageUploader
  end
end
