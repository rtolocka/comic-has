require 'test_helper'

class IssueRangeTest < ActiveSupport::TestCase
    test "the truth" do
        assert false
    end
    
    test "low issue may not be higher than high issue"
        issue_range = FactoryGirl.build(:issue_range, :low=>6, :high=>5)
        issue_range.save
end