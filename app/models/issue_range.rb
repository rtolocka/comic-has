class IssueRange < ActiveRecord::Base
  belongs_to :title
  attr_accessible :high, :low
  validates :low, :numericality => { :only_integer => true }  
  validates :high, :numericality => { :only_integer => true, :greater_than => :low, :message => "Low must be less than high."}  
  
  private
    def create_issues
        i = low;
        for i in low..high
            Title.issue.create
            
            issue.title = :title
            issue.number = i
            issue.save
        end
    end
end