class StaticController < ApplicationController
    before_action :checkadmin,only: [:update, :destroy]
    
     

     private

      def checkadmin
      signed_in?
        if current_user.admin? || current_user.host?
            @user = User.find(params[:id])     
        else
            return false      
            
        end
      end

    
      def make_admin
        if current_user.admin? || current_user.host?
            @user = User.find params[:id]
            user.admin!
            respond_to do |format|    
            format.html {render :make_admin,sucess: "#{user} has been updated as admin!" }
            format.js
            end
        else            
            respond_to do |format|    
            format.html {render :make_admin ,warning: "Wrong action!" }
            format.js
            end
        end
        
    end

end
