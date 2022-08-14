class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  before_action :set_default_locale

  def set_default_locale
    I18n.locale = params[:locale] || :en
  end
end
