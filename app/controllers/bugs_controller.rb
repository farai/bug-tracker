class BugsController < ApplicationController
  # GET /bugs
  # GET /bugs.json
  before_filter :authenticate_user!, :except => [:index, :show]
  
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  def index
    @bugs = Bug.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bugs }
    end
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
    @bug = Bug.find(params[:id])
    @comments = @bug.comments.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bug }
    end
  end

  # GET /bugs/new
  # GET /bugs/new.json
  def new
    @bug = Bug.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bug }
    end
  end

  # GET /bugs/1/edit
  def edit
    @bug = Bug.find(params[:id])
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @bug = current_user.bugs.new(params[:bug])

    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, notice: 'Bug was successfully reported.' }
        format.json { render json: @bug, status: :created, location: @bug }
      else
        format.html { render action: "new" }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bugs/1
  # PUT /bugs/1.json
  def update
    @bug = Bug.find(params[:id])

    respond_to do |format|
      if @bug.update_attributes(params[:bug])
        format.html { redirect_to @bug, notice: 'Bug information was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    respond_to do |format|
      format.html { redirect_to bugs_url }
      format.json { head :ok }
    end
  end
  
  
  protected
    def record_not_found
      flash[:error] = 'The bug you are looking for could not be found.'
      redirect_to root_url
    end
end