class Forums::TopicsController < ApplicationController
	# Login Required
	before_filter :user_required, :except => [:index, :show]
	
  # GET /forums/topics
  # GET /forums/topics.xml
  def index
    @forums_topics = Forums::Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forums_topics }
    end
  end

  # GET /forums/topics/1
  # GET /forums/topics/1.xml
  def show
    @forums_topic = Forums::Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forums_topic }
    end
  end

  # GET /forums/topics/new
  # GET /forums/topics/new.xml
  def new
    @forums_topic = Forums::Topic.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forums_topic }
    end
  end

  # GET /forums/topics/1/edit
  def edit
    @forums_topic = Forums::Topic.find(params[:id])
  end

  # POST /forums/topics
  # POST /forums/topics.xml
  def create    
    # Add last post time and user name
    
    @forums_topic = Forums::Topic.new(params[:forums_topic])
    
    # Extra Params
    @forums_topic.last_post_at = Time.now
    @forums_topic.last_poster_id = current_user.id
    @forums_topic.user_id = current_user.id
    @forums_topic.post.user_id = current_user.id
    
    # Finallise the save.
    respond_to do |format|  
      if @forums_topic.save     
        format.html { redirect_to(@forums_topic, :notice => 'Topic was successfully created.') }
        format.xml  { render :xml => @forums_topic, :status => :created, :location => @forums_topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forums_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forums/topics/1
  # PUT /forums/topics/1.xml
  def update
    @forums_topic = Forums::Topic.find(params[:id])

    respond_to do |format|
      if @forums_topic.update_attributes(params[:forums_topic])
        format.html { redirect_to(@forums_topic, :notice => 'Topic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forums_topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/topics/1
  # DELETE /forums/topics/1.xml
  def destroy
    @forums_topic = Forums::Topic.find(params[:id])
    @forums_topic.destroy

    respond_to do |format|
      format.html { redirect_to(forums_topics_url) }
      format.xml  { head :ok }
    end
  end
end
