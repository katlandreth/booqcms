module Dashboard
  class Medium < ActiveRecord::Base
    mount_uploader :file, Dashboard::ImageUploader
  end
end
