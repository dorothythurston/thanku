module CardHelper
  def recipient_name_or_link(recipient_email, recipient_name = "")
    recipient = User.find_by_email(recipient_email) || Guest.new
    if recipient.guest?
      recipient_name
    else
      link_to recipient.name, user_path(recipient)
    end
  end
end
