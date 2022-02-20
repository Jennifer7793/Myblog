class RegistrationsController < Devise::RegistrationController
  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    blogs_path || super
  end

  def create
    sign_in(@user)
    redirect_to blogs_path
  end
end