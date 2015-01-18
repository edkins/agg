class Username < ActiveRecord::Base
  belongs_to :person
  belongs_to :website
end
