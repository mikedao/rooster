class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  private

  def valid_update_key?(key)
    key == ENV['update_key']
  end

  def valid_consume_key?(key)
    key == ENV['consume_key']
  end

end
