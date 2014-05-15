class Card < ActiveRecord::Base
  belongs_to :user
  validates :recipient_name, presence: true
  validates :recipient_email, presence: true
  validates :sender_name, presence: true
  validates :sender_email, presence: true
  validates :image_url, presence: true
  validates :body, presence: true
end
