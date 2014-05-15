class UsersController < ApplicationController
  before_filter :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @cards = Card.where('recipient_email ilike ?', current_user.email)
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end
end

