class SresultsController < ApplicationController
  
  def index
  	@cmd_search = Cmd.search do
  		fulltext params[:search]
  	end
  	@cmd_result = @cmd_search.results
  end


end
