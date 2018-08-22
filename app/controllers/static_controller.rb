class StaticController < ApplicationController
    before_action :checkadmin,only: [:update, :destroy]
     def profile
     end

     private

      def checkadmin
      signed_in? ? current_user.admin : false
    end

end
