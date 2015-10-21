class DashboardController < ApplicationController
  def index
  	@command = Cmd.all
  	@conventions = Convention.all
  	@mhds = Mhd.all
  	@eror = Eror.all
  end
end
