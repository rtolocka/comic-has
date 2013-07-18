class ModeController < ApplicationController
    
    def have
        @issues = Issue.where("mode =?", params[:mode])
        render 'issues/results.js.erb'
    end

    def want
        @issues = Issue.where("mode =?", params[:mode])
        render 'issues/results.js.erb'
    end
end