class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    if params[:term] && params[:minimum_price] && params[:maximum_price]

     @listing = Listing.price_range(params[:minimum_price],params[:maximum_price]).page(params[:page]) && Listing.search(params[:term].downcase).page(params[:page])
     
    elsif params[:term]
      @listing = Listing.search(params[:term].downcase).page(params[:page])
      
    elsif params[:minimum_price] && params[:maximum_price]
      @listing = Listing.price_range(params[:minimum_price],params[:maximum_price]).page(params[:page])
    else
      @listing = Listing.all.order(created_at: :desc).page(params[:page])
    end
    
    respond_to do |format|    
        format.html {render :index }
        format.js
    end
    end
        

 
 

  # GET /listings
  # GET /listings.json
  # def index
  #   @listings = Listing.all
  # end

  # GET /listings/1
  # GET /listings/1.json
  

  def show
     if signed_in?
      @reservation = Reservation.new
      else
        redirect_to sign_in_path, info: 'Sign in to book a room.'

    end
  end

  # GET /listings/new
  def new
    if signed_in?
      @listing = Listing.new
      else
      redirect_to sign_in_path, info: 'Sign in to create a list.'
    end
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, success: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, success: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, success: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :price, :minimum_price, :maximum_price,:description, :address, :country, :city, :house_rules,
         :property_type, :facility, :amenity,:term ,{images: []},:tag_list, :tag, { tag_ids: [] }, :tag_ids)
    end
end
