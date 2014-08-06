require 'nokogiri'
require 'open-uri'

namespace :matches_parser do
  desc "gets matches from a website"
  task :parse => :environment do
    url = "http://www.world-cup.com.pl/2014/terminarz.php"
    page = Nokogiri::HTML(open(url))
    puts  "pracuje na stronie " + url
    parsedmatches = page.css('table#tabela1.terminarz2 td.terminarz')
    matches = []
    matchdata = page.css('table#tabela1.terminarz2 td')
    i = 0
    max = parsedmatches.count
    while i < max  do
      tn1 =  parsedmatches[i].text
      tn1[0] = ''
      tn2 =  parsedmatches[i+2].text
      tn2[0] = ''
      matches << Match.new(team_name_1: tn1, team_name_2: tn2, team_score_1: "0", team_score_2: "0")
      i += 3
    end
    # event = Tournament.new(name: "Mistrzostwa Świata 2014")
    event = Tournament.create(name: "Mistrzostwa Świata 2014")
    i = 0
    matches.each do |m|
      m.tournament_id = event.id
      t = Time.now
      matchday = matchdata[i].text
      matchmonth = matchday[3,2]
      matchday = matchday[0,2]
      t=t.change(day: matchday)
      t=t.change(month: matchmonth)
      t=t.change(year: 2015)
      m.deadline = t
      puts m.team_name_1.to_s + " vs " + m.team_name_2.to_s + " " + t.to_s
      m.save
      i+=4
    end
  end
end


