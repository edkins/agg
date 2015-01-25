class FbUsersController < ApplicationController
  def index
    @fb_users = FbUser.all
  end
end
