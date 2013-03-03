class IssuesController < ApplicationController
    def create
        @title = Title.find(params[:title_id])
        @issue = @title.issues.create(params[:issue]) 
        redirect_to title_path(@title)
    end
    
    # GET /titles/4/issues/1
    # GET /titles/4/issues//1.json
    def show
        @title = Title.find(params[:title_id])
        @issue = Issue.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render :json => @title }
        end
    end    
      
    # PUT /titles/1/issues/2
    def update
        @title = Title.find(params[:title_id])
        @issue = @title.issues.find(params[:id])

        respond_to do |format|
            if @issue.update_attributes(params[:issue])
                format.html { redirect_to @title, :notice => 'Issue was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render :action => "edit" }
                format.json { render :json => @issue.errors, :status => :unprocessable_entity }
            end
        end
    end  
    
    def edit
        @title = Title.find(params[:title_id])
        @issue = @title.issues.find(params[:id])
    end

    def delete
        @issue = Issue.find(params[:issue_id])
        respond_to do |format|
            format.html # delete.html.erb
        end
    end

    def destroy
        @issue = Issue.find(params[:issue_id])
        redirect_to(@title) and return if params[:cancel]
        @issue.destroy
        respond_to do |format|
            format.html { redirect_to title_path }
        end
    end
   
end