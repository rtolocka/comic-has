class Publisher < ActiveRecord::Base
  attr_accessible :name
  has_many :titles
end