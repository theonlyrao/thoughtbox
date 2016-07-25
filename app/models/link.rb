class Link < ActiveRecord::Base

  validates :address, :url => true
end
