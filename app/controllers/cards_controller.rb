class CardsController < ApplicationController
  respond_to :html

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
    redirect_to @card
  end

  def show
    @card = find_card
  end

  def edit
    @card = find_card
  end

  def update
    @card = find_card
    @card.update(card_params)
    respond_with @card
  end

  private

  def find_card
    Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(
      :recipient_name,
      :recipient_email,
      :sender_name,
      :sender_email,
      :body,
      :image_url
    ).merge(user_id: current_user.id)
  end
end
