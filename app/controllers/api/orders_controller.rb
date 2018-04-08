class Api::OrdersController < ApplicationController
  include OrdersHelper
  def index
    player_name = '川端　慎吾'
#    player_name = '山田　哲人'
    @playing_info = get_playing_info(player_name)
  end
end
