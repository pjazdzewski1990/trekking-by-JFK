class MarkersController < ApplicationController
  # GET /markers
  # GET /markers.json
  def index
    @markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
	  @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @markers }
    end
  end

  # GET /markers/1
  # GET /markers/1.json
  def show
    @markers = Marker.order("name").page(params[:page]).per(4)#Marker.all

    @marker = Marker.find(params[:id])

	  @map = Cartographer::Gmap.new( 'map' )
	  @map.zoom = :bound
	  @map.debug = true
	  normal_icon = Cartographer::Gicon.new
	  @map.icons << normal_icon
    marker1 = Cartographer::Gmarker.new(:name=> @marker.name, :marker_type => "Building",
        :position => [@marker.posX, @marker.posY], :icon => normal_icon,
		:info_window_url => @marker.url)
	  @map.markers << marker1
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marker }
    end
  end

  # GET /markers/new
  # GET /markers/new.json
  def new
    @markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
    @marker = Marker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marker }
    end
  end

  # GET /markers/1/edit
  def edit
	@markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
    @marker = Marker.find(params[:id])
  end

  # POST /markers
  # POST /markers.json
  def create
	@markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
    @marker = Marker.new(params[:marker])

    respond_to do |format|
      if @marker.save
        format.html { redirect_to @marker, notice: 'Marker was successfully created.' }
        format.json { render json: @marker, status: :created, location: @marker }
      else
        format.html { render action: "new" }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /markers/1
  # PUT /markers/1.json
  def update
	@markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
    @marker = Marker.find(params[:id])

    respond_to do |format|
      if @marker.update_attributes(params[:marker])
        format.html { redirect_to @marker, notice: 'Marker was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markers/1
  # DELETE /markers/1.json
  def destroy
	@markers = Marker.order("name").page(params[:page]).per(4)#Marker.all
    @marker = Marker.find(params[:id])
    @marker.destroy

    respond_to do |format|
      format.html { redirect_to markers_url }
      format.json { head :ok }
    end
  end
  
  def desc
	render :text => "Informacje o " + params[:id]
  end
end
