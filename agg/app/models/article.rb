class Article < ActiveRecord::Base
  belongs_to :website
  has_many :comments
end
