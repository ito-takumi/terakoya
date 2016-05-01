class TopController < ApplicationController
  def show
  end

require 'pp'
  def redirect
    redirect_to "/#{I18n.locale}"
  end
end
