class Ckeditor::Picture < Ckeditor::Asset
  mount_uploader :data, CkeditorPictureUploader, mount_on: :data_file_name

  def url_content
    url(:content)
  end
  
  #https://github.com/galetahub/ckeditor/issues/739
  self.inheritance_column = nil
end
