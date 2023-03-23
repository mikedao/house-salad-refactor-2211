class SearchController < ApplicationController
  def index
    @facade = SearchFacade.new(params)
  end
end