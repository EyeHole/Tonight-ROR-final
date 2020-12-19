# frozen_string_literal: true

# Main controller
class ApplicationController < ActionController::Base
  before_action :set_locale
  @@prev_locale = 'ru'

  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
      @@prev_locale = params[:locale]
    else
      I18n.locale = @@prev_locale
    end
  end
end
