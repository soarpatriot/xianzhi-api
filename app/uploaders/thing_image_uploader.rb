class ThingImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  CarrierWave.root = "#{G2.config.root_dir}"
  
  # Choose what kind of storage to use for this uploader:
  storage :qiniu
  
  self.qiniu_access_key    = 'XCgScHiJh4heRpcy_eNN3iWS72Osg0cc-Li9aZIj'
  self.qiniu_secret_key    = 'cAS2sKDW35hQDahtqDJwKy9hudBoBGZEILVXXZ5o'
  self.qiniu_bucket        = 'soarpatriot'
  self.qiniu_bucket_domain = 'soarpatriot.qiniudn.com'
  self.qiniu_bucket_private= false
  self.qiniu_block_size    = 4*1024*1024
  self.qiniu_protocol      = "http"
  self.qiniu_can_overwrite = true

  def qiniu_async_ops
      commands = []
      %W(small little middle large).each do |style|
        commands << "http://#{self.qiniu_bucket_domain}/#{self.store_dir}/#{self.filename}/#{style}"
      end
      commands
  end


  def store_dir
    "picture"
  end
  # def store_path
  #  filename
  # end
  # def store_dir
  #   "#{G2.config.root_dir}/public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end


  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{SecureRandom.uuid()}#{File.extname(original_filename)}" if original_filename.present?
  end

end
