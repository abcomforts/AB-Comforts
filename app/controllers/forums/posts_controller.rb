class Forums::PostsController < ApplicationController
	# Login Required
	before_filter :user_required, :except => [:index, :show]
	
  # GET /forums/posts
  # GET /forums/posts.xml
  def index
    @forums_posts = Forums::Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forums_posts }
    end
  end

  # GET /forums/posts/1
  # GET /forums/posts/1.xml
  def show
    @forums_post = Forums::Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forums_post }
    end
  end

  # GET /forums/posts/new
  # GET /forums/posts/new.xml
  def new
    @forums_post = Forums::Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forums_post }
    end
  end

  # GET /forums/posts/1/edit
  def edit
    @forums_post = Forums::Post.find(params[:id])
  end

  # POST /forums/posts
  # POST /forums/posts.xml
  def create
    @forums_post = Forums::Post.new(params[:forums_post])
    @forums_post.user_id = current_user.id
    
    @forums_topic = Forums::Topic.find(@forums_post.topic_id)  
    @forums_topic.update_attributes(:last_poster_id => current_user.id, :last_post_at => Time.now)
    
    respond_to do |format|
      if @forums_post.save
        format.html { redirect_to ("/forums/topics/#{@forums_post.topic_id}", :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @forums_post, :status => :created, :location => @forums_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forums_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forums/posts/1
  # PUT /forums/posts/1.xml
  def update
    @forums_post = Forums::Post.find(params[:id])

    respond_to do |format|
      if @forums_post.update_attributes(params[:forums_post])
        format.html { redirect_to("/forums/topics/#{@forums_post.topic_id}", :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forums_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/posts/1
  # DELETE /forums/posts/1.xml
  def destroy
    @forums_post = Forums::Post.find(params[:id])
    @forums_post.destroy

    respond_to do |format|
      format.html { redirect_to(forums_posts_url) }
      format.xml  { head :ok }
    end
  end
end
