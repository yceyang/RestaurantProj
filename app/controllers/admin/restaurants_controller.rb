class Admin::RestaurantsController < ApplicationController
  # user login 
  before_action :authenticate_user!
  # self define admin action
  before_action :authenticate_admin
end
