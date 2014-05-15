class SentCardsController < ApplicationController
  before_filter :require_login
  def show
    @cards = current_user.cards
  end
end
