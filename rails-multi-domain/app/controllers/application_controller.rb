class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_theme

  before_filter :check_for_customer_accounts

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login, :username, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :firstname, :lastname,
                                                              :password, :password_confirmation, :current_password])
  end

  def configure_theme
    @site = Sites.site_by_host(request.host)
    @theme = @site
  end

  private

    def check_for_customer_accounts
      @site ||= Sites.site_by_host(request.host)
      if @site != 'admin' && current_user && current_user.customers.any?
        accounts = current_user.customers.map{|customer| customer.accounts.any? }
        if !accounts.include?(true) && !request.path.split('/').any?{|path_val| ['vendor_accounts', 'users'].include?(path_val)}
          redirect_to new_carrier_account_path
        end
      end
    end

end
