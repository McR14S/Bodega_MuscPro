class Authentication::SessionsController < ApplicationController
    
    def new
    end

    def create
        
        #Comprobamos datos y verificamos tanto para usuario y email si existen
        @user = User.find_by("email = :login OR username = :login", { login: params[:login] })

        if @user&.authenticate(params[:password])
            redirect_to products_path, notice: t('.created')
        else
            redirect_to new_session_path, alert: t('.failed')
            #render :new, status: :unprocessable_entity
        end
        # @user = User.new(user_params)

        # if @user.save
        #     redirect_to products_path, notice: t('.created')
        # else
        #     render :new, status: :unprocessable_entity
        # end
    end

    # private

    # def user_params
    #     params.require(:user).permit(:email, :username, :password)
    # end
end