class Item < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :desc
  validates_presence_of :thumbnail
  validates_presence_of :image_preview
  validates_presence_of :download
  has_many :tags
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
      :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
      
      has_attached_file :image_preview, :styles => { :small => "150x150>" },
                      :url  => "/assets/items/image_preveiw/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/items/image_preveiw/:id/:style/:basename.:extension"
      validates_attachment_size :image_preview, :less_than => 10.megabytes
      validates_attachment_content_type :image_preview, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
      
            
      has_attached_file :thumbnail, :styles => { :small => "25x25>" },
                      :url  => "/assets/items/thumbnail/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/items/thumbnail/:id/:style/:basename.:extension"
      validates_attachment_size :thumbnail, :less_than => 10.megabytes
      validates_attachment_content_type :thumbnail, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
      
      has_attached_file :download,
                      :url  => "/assets/items/thumbnail/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/items/thumbnail/:id/:style/:basename.:extension"
      validates_attachment_size :thumbnail, :less_than => 50.megabytes
      validates_attachment_content_type :thumbnail, :content_type => ['image/jpeg', 'image/png  ', 'image/jpg']


  
end
