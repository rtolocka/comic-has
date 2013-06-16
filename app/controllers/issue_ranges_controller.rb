class IssueRangesController < ApplicationController

    def new 
        @title = Title.find(params[:title_id])
        @issue_range = @title.issue_ranges.build
    end

    # POST /issue_ranges
    # POST /issue_ranges.json
    def create
        @title = Title.find(params[:title_id])
        @issue_range = @title.issue_ranges.create(params[:issue_range])
        create_issues()
        @issues = @title.issues.all
        redirect_to title_path(@title)
    end
      
    def create_issues
        i = @issue_range.low;
        logger.debug(@issue_range.high)
        for i in @issue_range.low..@issue_range.high
            @title.issues.create("number" => i)
        end
    end
    
    # GET /titles/4/
    # GET /titles/4.json
    def index
        @title = Title.find(params[:title_id])
        @issue_ranges = IssueRange.where("title = ?", params[:title])
    
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @issue_ranges }
        end
    end
    
      # GET /issue_ranges/1
      # GET /issue_ranges/1.json
    def show
        @title = Title.find(params[:title_id])
        @issue_range = IssueRange.find(params[:id])
    
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @issue_range }
        end
    end
    
      # GET /issue_ranges/new
      # GET /issue_ranges/new.json
      #def new
      #  @issue_range = IssueRange.new
    
      #  respond_to do |format|
      #    format.html # new.html.erb
      #    format.json { render json: @issue_range }
      #  end
      #end
    
      # GET /issue_ranges/1/edit
    def edit
        @issue_range = IssueRange.find(params[:id])
    end
    
    # PUT /issue_ranges/1
    # PUT /issue_ranges/1.json
    def update
        @issue_range = IssueRange.find(params[:id])
    
        respond_to do |format|
          if @issue_range.update_attributes(params[:issue_range])
            format.html { redirect_to @issue_range, notice: 'Issue range was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @issue_range.errors, status: :unprocessable_entity }
          end
        end
    end
    
    # DELETE /issue_ranges/1
    # DELETE /issue_ranges/1.json
    def destroy
        @issue_range = IssueRange.find(params[:id])
        @issue_range.destroy
    
        respond_to do |format|
          format.html { redirect_to issue_ranges_url }
          format.json { head :no_content }
        end
    end
end
