class Publisher < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with PublisherValidator
    attr_accessible :name
    has_many :titles
end