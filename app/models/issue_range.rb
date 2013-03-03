class IssueRange < ActiveRecord::Base
  belongs_to :title
  attr_accessible :high, :low
  #validates :high, :low => true
  
  #after_save :create_issues
  
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