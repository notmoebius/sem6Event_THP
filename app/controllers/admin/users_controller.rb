class Admin::UsersController < ApplicationController
    def index
      @users = User.all
      #puts @users
    end
  end