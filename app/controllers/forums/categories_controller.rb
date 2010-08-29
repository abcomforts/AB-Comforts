class Forums::CategoriesController < ApplicationController
  # GET /forums/categories
  # GET /forums/categories.xml
  def index
    @forums_categories = Forums::Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forums_categories }
    end
  end

  # GET /forums/categories/1
  # GET /forums/categories/1.xml
  def show
    @forums_category = Forums::Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forums_category }
    end
  end

  # GET /forums/categories/new
  # GET /forums/categories/new.xml
  def new
    @forums_category = Forums::Category.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forums_category }
    end
  end

  # GET /forums/categories/1/edit
  def edit
    @forums_category = Forums::Category.find(params[:id])
  end

  # POST /forums/categories
  # POST /forums/categories.xml
  def create
    @forums_category = Forums::Category.new(params[:forums_category])

    respond_to do |format|
      if @forums_category.save
        format.html { redirect_to(@forums_category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @forums_category, :status => :created, :location => @forums_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forums_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forums/categories/1
  # PUT /forums/categories/1.xml
  def update
    @forums_category = Forums::Category.find(params[:id])

    respond_to do |format|
      if @forums_category.update_attributes(params[:forums_category])
        format.html { redirect_to(@forums_category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forums_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/categories/1
  # DELETE /forums/categories/1.xml
  def destroy
    @forums_category = Forums::Category.find(params[:id])
    @forums_category.destroy

    respond_to do |format|
      format.html { redirect_to(forums_categories_url) }
      format.xml  { head :ok }
    end
  end
end