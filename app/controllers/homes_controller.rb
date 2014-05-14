class HomesController < ApplicationController
  def show
    @user = User.new
    @cards = Card.all
  end
end
