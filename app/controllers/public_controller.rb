class PublicController < ApplicationController
  def bag_selection
  end

  def item_selection
    session[:bag] = params[:bag]
  end

  def check_out
    items = params[:ids]
    bag = session[:bag]
    
    
  end
end
