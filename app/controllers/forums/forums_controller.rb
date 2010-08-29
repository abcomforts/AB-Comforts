class Forums::ForumsController < ApplicationController
	# Login Required
	before_filter :user_required, :except => [:index, :show]
	
  # GET /forums/forums
  # GET /forums/forums.xml
  def index
    @forums_forums = Forums::Forum.all
    @forums_categories = Forums::Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forums_forums }
    end
  end

  # GET /forums/forums/1
  # GET /forums/forums/1.xml
  def show
    @forums_forum = Forums::Forum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forums_forum }
    end
  end

  # GET /forums/forums/new
  # GET /forums/forums/new.xml
  def new
    @forums_forum = Forums::Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forums_forum }
    end
  end

  # GET /forums/forums/1/edit
  def edit
    @forums_forum = Forums::Forum.find(params[:id])
  end

  # POST /forums/forums
  # POST /forums/forums.xml
  def create
    @forums_forum = Forums::Forum.new(params[:forums_forum])

    respond_to do |format|
      if @forums_forum.save
        format.html { redirect_to(@forums_forum, :notice => 'Forum was successfully created.') }
        format.xml  { render :xml => @forums_forum, :status => :created, :location => @forums_forum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forums_forum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forums/forums/1
  # PUT /forums/forums/1.xml
  def update
    @forums_forum = Forums::Forum.find(params[:id])

    respond_to do |format|
      if @forums_forum.update_attributes(params[:forums_forum])
        format.html { redirect_to(@forums_forum, :notice => 'Forum was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forums_forum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/forums/1
  # DELETE /forums/forums/1.xml
  def destroy
    @forums_forum = Forums::Forum.find(params[:id])
    @forums_forum.destroy

    respond_to do |format|
      format.html { redirect_to(forums_root_url) }
      format.xml  { head :ok }
    end
  end
end
