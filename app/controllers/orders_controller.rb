class OrdersController < ApplicationController
  include OrdersHelper
  def index
    player_name = '川端慎吾'
    @playing_info = get_playing_info(player_name)
  end
end
