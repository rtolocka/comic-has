class Issue < ActiveRecord::Base
   belongs_to :title
   attr_accessible :number
   validates :number, :presence => true
end
