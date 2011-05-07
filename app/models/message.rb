class Message < ActiveRecord::Base
belongs_to :item
has_ancestry
end
