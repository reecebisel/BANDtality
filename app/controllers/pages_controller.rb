class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:founders]
  layout 'logged_in', only: [:welcome, :settings]
  
  def welcome
  end

  def choose_profile
  end

  def founders
  end

  def settings
  end
end

