class Admin::DashboardController < ApplicationController
  #admin acess
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def show
  end

end
