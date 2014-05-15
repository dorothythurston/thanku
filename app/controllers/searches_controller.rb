class SearchesController < ApplicationController
  def show
    @query = params[:search][:query]
    @users = UserSearcher.new(@query).results.order(params[:sort])
  end
end
