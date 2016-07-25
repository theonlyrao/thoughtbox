class Link < ActiveRecord::Base
  default_scope { order('created_at ASC') }
  validates :address, :url => true
end
