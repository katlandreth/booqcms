# encoding: utf-8
module Dashboard
  class ImageUploader < CarrierWave::Uploader::Base

    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
     include CarrierWave::MiniMagick

    # Choose what kind of storage to use for this uploader:
    # storage :file

    storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Provide a default URL as a default if there hasn't been a file uploaded:
     #def default_url
    #   # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "writing.jpg"].compact.join('_'))
    #
    #"/images/fallback/" + [version_name, "writing.jpg"].compact.join('_')
    #'writing.jpg' #rails will look at 'app/assets/images/default_avatar.png'
     #end

    # Process files as they are uploaded:
    # process :scale => [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end
    process :auto_orient

    def auto_orient
      manipulate! do |img|
         img.auto_orient
       end
     end

    # Create different versions of your uploaded files:
     version :thumb do
       process :resize_to_fit => [1000, 1000]
     end

     version :pinterest_image do
       process :resize_to_fit => [735, 1120]
     end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
     def extension_white_list
       %w(jpg jpeg gif png)
     end

    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end

  end
end
