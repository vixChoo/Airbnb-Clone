class AdminController < ApplicationController
    before_action :logged_in?
    before_action :checkadmin
    layout "admin_layout"
    after_action :set_users, only: [ :edit, :update, :destroy_admin,:make_admin]
    after_action :set_listing, only: [:edit, :destroy]
    after_action :set_reservation, only: [:edit, :destroy]
    after_action :set_tag, only: [:edit, :destroy,:update]

    

    def index
        
    end
    
     def users
        if current_user.admin? || current_user.host?
            @users = User.all
        else
            redirect_to listings_path, danger:"You not an admin!"
        end
    end
     
    
         def make_admin
            if current_user.admin? || current_user.host?
              set_users
                @user.admin!
             redirect_to admin_users_path , success: " #{@user.first_name} #{@user.last_name} is an admin now"
           end
         end
         
         def destroy_admin
            if current_user.admin? || current_user.host?
                set_users
             @user.member!
             redirect_to admin_users_path , warning: " #{@user.first_name} #{@user.last_name} is an member now"
           end
         end
        
     def listings
        if current_user.admin? || current_user.host?
            @listings = Listing.all
         else
            redirect_to listings_path, danger:"You not an admin!"
        end
     end

     def reservations
        if current_user.admin? || current_user.host?
            @reservations = Reservation.all
          
         else
            redirect_to listings_path, danger:"You not an admin!"
        end
     end
     
     def tags
        if current_user.admin? || current_user.host?
            @tags = Tag.all
            # @tags = Tag.all.sort {|a,b| a.tag_counts <=> b.tag_counts}

        else
            redirect_to listings_path, danger:"You not an admin!"
        end
     end

    

     private
     
     def set_users
        @user = User.find(params[:id])
    end
     def set_tag
        @tag = Tag.find(params[:id])   
    end
    
    def set_listing
        @listing = Listing.find(params[:id])     
    end

    def set_reservation
        @reservation = Reservation.find(params[:id])     
    end
    
    def logged_in?
        unless current_user
            redirect_to sign_in_path, danger:"Please log in to proceed"    
        end
    end

    def checkadmin
        unless current_user.admin? || current_user.host?
            redirect_to static_profile_path, danger:"You not an admin!"    
        end
    end

    
    
    
end
