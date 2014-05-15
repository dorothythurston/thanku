class CardsController < ApplicationController
  before_filter :require_login
  respond_to :html

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
    @recipient = User.find_by_id(params[:recipient_id]) || Guest.new
  end

  def create
    @card = Card.create(card_params)
    @recipient = find_recipient
    if @card.save(card_params)
      redirect_to @card
    else
      render :new
    end
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

  def destroy
    @card = find_card
    @card.destroy
    redirect_to dashboard_path
  end

  private

  def find_card
    Card.find(params[:id])
  end

  def find_recipient
    User.find_by_email(params[:card][:recipient_email]) || Guest.new
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
