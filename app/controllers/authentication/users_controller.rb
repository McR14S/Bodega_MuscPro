class Authentication::UsersController < ApplicationController
    def new
        @users = User.new
    end

    def create
        
    end
end