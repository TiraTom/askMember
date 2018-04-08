class Api::PlayersController < ApplicationController
  include PlayersHelper
  def index
    player_name = player_params[:name]
#    @player_name = '川端　慎吾'
#    player_name = '山田　哲人'

    playing_info = get_playing_info(player_name)
    render json: {player: player_name, result: playing_info}
  end

  private
  def player_params
    params.permit(:name)
  end
end
