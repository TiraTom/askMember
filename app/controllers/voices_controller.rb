class VoicesController < ApplicationController
  def voice
    voice = "xxx"
    @player_name = listen(voice)
    playing_info = get_playing_info(player_name)
    @result = playing_info
  end

end
