class Title < ActiveRecord::Base
   attr_accessible :name, :publisher
   
   validates :name,  :presence => true

   has_many :issues
end
