class OrdersController < ApplicationController
  include OrdersHelper
  def index
    player_name = '川端慎吾'
    playing_member = get_playing_member
    
  end
end
