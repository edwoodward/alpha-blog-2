class PagesController < ApplicationController
  def home 
    redirect_to articles_path if session[:user_id]
  end

  def about
  end
end
