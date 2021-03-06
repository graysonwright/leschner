# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick

   process :resize_to_limit =>[500, 500]

   if Rails.env.production?
     storage :fog
   else
     storage :file
   end


   def store_dir
     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
   end

   def extension_white_list
     %w(jpg jpeg gif png)
   end
end
