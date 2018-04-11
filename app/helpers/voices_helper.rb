require 'open-uri'

module VoicesHelper

  def listen
    request_url = "https://speech.googleapis.com/v1/speech:recognize?key=" + ENV["GOOGLE_API_KEY"]
    res = open(request_url)
    code, message = res.status
    if code == '200'
      text = ActiveSupport::JSON.devode res.read
      return text
    else
      return "ERROR #{code} : #{message}"

  end



end
