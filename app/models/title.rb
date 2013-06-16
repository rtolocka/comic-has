class Title < ActiveRecord::Base
   belongs_to :publisher
   attr_accessible :name
   attr_accessible :publisher_id # to get around 'cannot mass-assign attributes' error.
   validates :name, :presence => true
   validates :publisher, :presence =>true
   has_many :issues
   has_many :issue_ranges
end