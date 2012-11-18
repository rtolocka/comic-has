class IssuesController < ApplicationController
   def create
      @title = Title.find(params[:title_id])
      @issue = @title.issues.create(params[:issue])
      redirect_to title_path(@title)
   end

   def create_many
      @title = Title.find(params[:title_id])
      issues = params[ranges].to_a
      issues.each do |issueNumber|
         @title.issues.create(issueNumber)
      end
   end
      
   def delete
      @issue = Issue.find(params[:issue_id])
      respond_to do |format|
         format.html # delete.html.erb
   end

   def destroy
      @issue = Issue.find(params[:issue_id])
      redirect_to(@title) and return if params[:cancel]
      @issue.destroy
      respond_to do |format|
         format.html { redirect_to title_path }
   end
end
