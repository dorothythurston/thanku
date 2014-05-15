class User < ActiveRecord::Base
  has_many :cards

  def recieved_cards
    Card.where('recipient_email ilike ?', email)
  end

  def guest?
    false
  end
end
