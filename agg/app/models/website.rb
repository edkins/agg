class Website < ActiveRecord::Base
  has_many :feeds
  self.primary_key = "websiteid"
end
