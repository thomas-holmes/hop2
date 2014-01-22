class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end
end
