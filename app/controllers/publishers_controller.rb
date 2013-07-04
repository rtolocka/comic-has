class PublishersController < ApplicationController  

    # GET /publishers
    # GET /publishers.json
    def index
        @publishers = Publisher.all

        respond_to do |format|
            format.html # index.html.erb
        format.json { render :json => @publishers }
        end
    end

  # GET /publishers/1
  # GET /publishers/1.json
  def show
    @publisher = Publisher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @Publisher }
    end
  end

    # GET /publishers/new
    # GET /publishers/new.json
    def new
        @publisher = Publisher.new
    end

    # GET /publishers/1/edit
    def edit
        @publisher = Publisher.find(params[:id])
    end

    # POST /publishers
    # POST /publishers.json
    def create
        @publisher = Publisher.new(params[:publisher])
        if @publisher.save
            @publishers = Publisher.all
            flash[:notice] = "You've created a new publisher!"
            render 'results'
          else
            # BAD SHIT - FIXME         
        end
    end

  # PUT /publishers/1
  # PUT /publishers/1.json
  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(params[:publisher])
        @publishers = Publisher.all
        flash[:notice] = "You've updated a publisher!"
        render 'results'
    else
        #BAD SHIT - FIXME
    end
  end

  # DELETE /publishers/1
  # DELETE /publishers/1.json
  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    @publishers = Publisher.all
    flash[:notice] = "You've deleted this publisher."
    render 'results'
  end
end
