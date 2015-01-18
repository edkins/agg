class FbThread < ActiveRecord::Base
  belongs_to :fb_group, inverse_of: :fb_threads
end
