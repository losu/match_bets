require 'nokogiri'
require 'open-uri'

namespace :matches_parser do

  desc "Pick a random user as the winner"
  task :winner => :environment do
    puts "Winner: #{pick(User).nickname}"
  end 

  desc "gets some data from a website"
  task :parse => :environment do
    url = "http://www.world-cup.com.pl/2014/terminarz.php"
    page = Nokogiri::HTML(open(url))
    puts  "pracuje na stronie " + url
    matchdata = page.css('table#tabela1.terminarz2 td.terminarz')
    matches = []
    i = 0
    max = matchdata.count
    while i < max  do
      matches << Match.new(team_name_1: matchdata[i].text.slice!(0), team_name_2: matchdata[i+2].text.slice!(0),team_score_1: "0", team_score_2: "0", deadline: Time.now + 2.day)
      i += 3
    end
    matches.each do |kkk|
      puts kkk.team_name_1.to_s + " vs " + kkk.team_name_2.to_s

    end
    # matches.each{|link| puts link.text}
    # puts matches.count





  end
  
  def pick(model_class)
    # model_class.find(:first, :order => 'RAND()')
    model_class.first
  end
end


