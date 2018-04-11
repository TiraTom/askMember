require 'open-uri'
require 'nokogiri'
require 'selenium-webdriver'

module ApplicationHelper
  def get_playing_info(player_name)
    driver = Selenium::WebDriver.for :firefox

    driver.navigate.to "https://www.yakult-swallows.co.jp"
    game_info_link = driver.find_element(:class, "index-game-live")
    game_info_link.click
    game_info_page_details = driver.find_elements(:class, "wrap")
    game_info_page_details[1].find_elements(:tag_name, "a")[1].click
    playing_member_by_team = driver.find_elements(:class, "list-players-game")

    for team in playing_member_by_team
      if team.find_element(:tag_name, "h3").text ==  "ヤクルト 出場中選手"
        playing_members = team.find_elements(:tag_name, "h2")
      end
    end

    for member in playing_members
      if member.text == player_name
        driver.quit
        return '試合にでています！'
      end
    end
    driver.quit
    return '試合には出ていないようです・・・。'

  rescue Selenium::WebDriver::Error::NoSuchElementError
    driver.quit
    return '試合中ではないようです。'
  rescue
    driver.quit
    return 'データ取得中に何らかのエラーが発生しました。'
  end



end
