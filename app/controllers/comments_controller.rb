class CommentsController < ApplicationController
  # GET /Comment
  # GET /Comment.xml
  def index
    @comments = Comment.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @comments }
    end
  end

  # GET /Comment/1
  # GET /Comment/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @comment }
    end
  end

  # GET /Comment/new
  # GET /Comment/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @comment }
    end
  end

  # GET /Comment/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /Comment
  # POST /Comment.xml
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(comment_path(@comment)) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Comment/1
  # PUT /Comment/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(comment_path(@comment)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Comment/1
  # DELETE /Comment/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
