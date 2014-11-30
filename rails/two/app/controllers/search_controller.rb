class SearchController < ApplicationController
  def get
  	@search_term = params[:q]
#test
	@projects = Project.where("title like \"%#{@search_term}%\"")
  end
end
