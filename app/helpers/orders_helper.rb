require 'open-uri'
require 'nokogiri'
require 'selenium-webdriver'

module OrdersHelper

  def get_playing_info(player_name)
    driver = Selenium::WebDriver.for :firefox

    driver.navigate.to "https://www.yakult-swallows.co.jp"
    game_info_link = driver.find_element(:class, "index-game-live")
    game_info_link.click
    game_info_page_details = driver.find_elements(:class, "wrap")
    game_info_page_details[1].find_elements(:tag_name, "a")[1].click
    playing_member_by_team = driver.find_elements(:class, "list-plalyers-game")

    playing_meber_by_team.each do |team, index|
      if team[index].find_elemnt(:taga_name, "h3").text ==  "ヤクルト 出場中選手"
        playing_members = driver.find_elements(:class, "list-players-game")[index].find_elements(:tag_name, "h2")
      end
    end

    playing_member.each do |member|
      if member.text == player_name
        return '試合にでています！'
      end
    end
    return '試合には出ていないようです・・・。'

  rescue Selenium::WebDriver::Error::NoSuchElementError
    return '試合中ではないようです。'
  rescue
    return 'データ取得中に何らかのエラーが発生しました。'
  end

end
