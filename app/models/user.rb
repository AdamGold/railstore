class User < ActiveRecord::Base
  has_many :items
  acts_as_voter
  attr_accessible :provider, :uid, :name
def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["user_info"]["name"]
  end
end
end
