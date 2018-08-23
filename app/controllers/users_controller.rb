class UsersController < Clearance::UsersController
  after_action :set_user, only: [:show, :edit,:update]


    def create
      @user = User.new(user_params)
      if @user.save
        UserMailer.with(user: @user).welcome_email.deliver_later
        redirect_to static_profile_path,success: "User created. Please confirm or edit details"
      else
        redirect_to sign_up_path, danger:"Bad email or password!"
      end
    end
    
    
      private
    
    def set_user
      @user = User.find(params[:id])
    end
           
  
      def user_params
        params.require(:user).permit(:avatar,:email, :first_name, :last_name, :birthdate, :password)
      end
  end