class TitlesController < BaseController
    
    # GET /titles
    # GET /titles.json
    def index
        @titles = Title.all
        # @titles = @titles.paginate(:page => params[:page])
        
        respond_to do |format|
            format.html # index.html.erb
            format.json { render :json => @titles }
        end
    end
    
    # JSON only
    def names
        @names = Title.pluck(:name)
        render :json => @names, :content_type => Mime::JSON
    end
    
    # JSON only
    def search
        if params[:searchfield].blank?
            @titles = Title.all
        else
            @titles = Title.where("name = ?", params[:searchfield])
        end
    end

    # GET /titles/1
    # GET /titles/1.json
    def show
        @title = Title.find(params[:id])
        @publisher = Publisher.find(@title.publisher_id)
        issue_ids = @title.issues.collect{ |issue| issue.id }
        @issues = Issue.find(issue_ids)

        respond_to do |format|
            format.html # show.html.erb
            format.json { render :json => @title }
        end
    end

    # GET /titles/new
    # GET /titles/new.json
    def new
        @title = Title.new
    end

    # GET /titles/1/edit
    def edit
        @title = Title.find(params[:id])
    end

    # POST /titles
    # POST /titles.json
    def create
        @title = Title.new(params[:title])
        if @title.save
            @titles = Title.order("created_at DESC").all
            flash[:notice] = "You've created a new title!"
            render 'results'
        else
            @title.errors.each do |attribute, errors_array|
                field_errors = attribute.to_s + " " + errors_array
                flash[:error] = field_errors
            end
            @titles = Title.all
            render 'titles/search.js.erb'
            #format.json { render :json => @issue.errors, :status => :unprocessable_entity }
        end
    end

  # PUT /titles/1
  # PUT /titles/1.json
  def update
    @title = Title.find(params[:id])
    if @title.update_attributes(params[:title])
        @titles = Title.all
        flash[:notice] = "You've updated the title!"
        render 'results'
    else
        #FIXME
    end
  end

  # DELETE /titles/1
  # DELETE /titles/1.json
  def destroy
    @title = Title.find(params[:id])
    @title.destroy
    @titles = Title.all
    flash[:notice] = "You've deleted the title!"
    render 'results'
  end
end
