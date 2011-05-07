class Item < ActiveRecord::Base
  attr_reader :per_page
  @@per_page = 10
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ? OR desc LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"], :joins => [:tags])
    else
      scoped
    end
  end
  belongs_to :user
  has_many :messages
  has_many :tags
  has_many :payment_notifications
  acts_as_voteable
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
      :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  validates_presence_of :thumbnail
  validates_presence_of :image_preview
  validates_length_of :title, :minimum => 5
  validates_length_of :desc, :minimum => 50
  validates_associated :tags
  validates_presence_of :tags
      validates_attachment_presence :image_preview
      validates_attachment_presence :thumbnail
      
      
  has_attached_file :image_preview,
                      :url  => "/assets/items/image_preveiw/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/items/image_preveiw/:id/:style/:basename.:extension"
      validates_attachment_size :image_preview, :less_than => 1.megabyte
      validates_attachment_content_type :image_preview, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
      
            
  has_attached_file :thumbnail,     
                      :url  => "/assets/items/thumbnail/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/items/thumbnail/:id/:style/:basename.:extension"
      validates_attachment_size :thumbnail, :less_than => 1.megabyte
      validates_attachment_content_type :thumbnail, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
      
      has_attached_file :download,
                          :url  => "/assets/items/download/:id/:style/:basename.:extension",
                          :path => ":rails_root/public/assets/items/download/:id/:style/:basename.:extension"
          validates_attachment_size :download, :less_than => 20.megabytes
          validates_attachment_content_type :download, :content_type => ['application/zip']
          
    def paypal_url(item, user, notify_url)
          values = {
        	:business => 'railsd_1304622257_biz@gmail.com',
        	:cmd => '_xclick',
        	:return => 'http://localhost:3000/items/' + item.id.to_s,
        	:invoice => item.id.to_s + user.id.to_s,
        	:notify_url => notify_url
          }

          values.merge!({
        	  "amount" => item.price,
        	  "item_name" => item.title,
        	  "item_number" => item.id,
        	})
          "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    end
      
end
