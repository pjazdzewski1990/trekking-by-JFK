class UsersController < ApplicationController

	require 'digest/md5'

  # GET /users
  # GET /users.json
  def index
     # if session[:person] == nil
	 # puts "index redirects to loginForm"
		 # return redirect_to :action => 'loginForm'
	 # end

	@markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
	
	@map = Cartographer::Gmap.new( 'map' )
	@map.zoom = :bound
	@map.debug = true
	normal_icon = Cartographer::Gicon.new
	@map.icons << normal_icon
	# marker1 = Cartographer::Gmarker.new(:name=> "taj_mahal", :marker_type => "Building",
          # :position => [27.173006,78.042086], :icon => normal_icon,
          # :info_window_url => "www.google.pl/")
	# marker2 = Cartographer::Gmarker.new(:name=> "raj_bhawan", :marker_type => "Building",
          # :position => [28.614309,77.201353],
          # :icon => normal_icon,
          # :info_window_url => "/url_for_info_content")

	# @map.markers << marker1
	# @map.markers << marker2
	
	for m in @markers do
     marker1 = Cartographer::Gmarker.new(:name=> m.name, :marker_type => "Building",
        :position => [m.posX, m.posY], :icon => normal_icon,
		:info_window_url => m.url)
	 @map.markers << marker1
	end
	
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
	@markers =  Marker.order("name").page(params[:page]).per(4)#Marker.all
	
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
	@markers =  Marker.order("name").page(params[:page]).per(4)#Marker.all
	
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
	@markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
	
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
	@markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
	
#@user = User.new(name: params[:user.name], pass: Digest::MD5.hexdigest(params[:user.pass]).to_s)
#puts "CR: " + params[:user.pass] + " -> " + Digest::MD5.hexdigest(params[:user.pass]).to_s
    @user = User.new(params[:user])
	respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
	@markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
	
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
	@markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
	
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  # def login
    # login = params[:login]
	# pass = params[:pass]
	# user = User.find_by_name(login)

    # respond_to do |format|
      # if user.pass != pass
        # return redirect_to :action => 'restricted'
      # else
		# session[:person] = user
        # return redirect_to :action => 'index'
      # end
    # end
  # end
  
  # def restricted
  # end
  
  # def logout
	# session[:person] = nil
  # end
  
  # def loginForm
	# puts "LOGIN FORM"
	# respond_to do |format|
      # format.html 
    # end
  # end
  
end
