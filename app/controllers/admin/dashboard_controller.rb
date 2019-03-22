class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "k", password: "k", except: :index

  def show
  end

end
