class UsersController < Clearance::UsersController

    def create
      @user = User.new(user_params)
      if @user.save
         UserMailer.with(user: @user).welcome_email.deliver_later
        redirect_to sign_in_path
      else
        redirect_to sign_up_path
      end
    end
  
      private
  
      def user_params
        params.require(:user).permit(:avatar,:email, :first_name, :last_name, :birthdate, :password)
      end
  end