require 'open-uri'
require 'nokogiri'
require 'selenium-webdriver'

module OrdersHelper

  def get_playing_member
    driver = Selenium::WebDriver.for :firefox

    driver.navigate.to "https://www.yakult-swallows.co.jp"
    byebug
    game_info_link = driver.find_element(:class, "index-game-live")
    if game_info_link.nil?
      return 'No Game'
    end
    game_info_link.click
    game_info_page_details = driver.find_elements(:class, "wrap")
    game_info_page_details[1].find_elements(:tag_name, "a")[1].click
    playing_member_by_team = driver.find_elements(:class, "list-plalyers-game")
    playing_meber_by_team.each do |team, index|
      if team[index].find_elemnt(:taga_name, "h3").text ==  "ヤクルト 出場中選手"
      end
    end

    playing_members = driver.find_elements(:class, "list-players-game")[index].find_elements(:tag_name, "h2")
    playing_member.each do |member|
      if member.text == "kawabata"
      end
    end

    return True

  end

end
