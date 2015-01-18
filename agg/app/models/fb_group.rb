class FbGroup < ActiveRecord::Base
  has_many :fb_threads, inverse_of: :fb_group
end
