class SearchController < ApplicationController
  def get
  	@search_term = params[:q]
	# we should use parametrized query here
	@projects = Project.where("title like \"%#{@search_term}%\"")
  end
end
