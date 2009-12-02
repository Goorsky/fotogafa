class UsersController < ApplicationController
  # GET /User
  # GET /User.xml
  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @users }
    end
  end

  # GET /User/1
  # GET /User/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @user }
    end
  end

  # GET /User/new
  # GET /User/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @user }
    end
  end

  # GET /User/1/edit
  def edit
    @user = current_user
  end

  # POST /User
  def create
    @user = User.new(params[:user])
    @user.save do |result|
      if result
        flash[:notice] = "Registration successful."
        redirect_to root_url
      else
        render :action => 'new'
      end
    end
  end

  def update
    @user = current_user
    @user.attributes = params[:user]
    @user.save do |result|
      if result
        flash[:notice] = "Successfully updated profile."
        redirect_to root_url
      else
        render :action => 'edit'
      end
    end
  end

  # DELETE /User/1
  # DELETE /User/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
