# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: 'member1@example.com', password: '123456789', password_confirmation: '123456789')
user2 = User.create(email: 'member2@example.com', password: '123456789', password_confirmation: '123456789')

data_articles =
  { 'Nigeria Boko Haram: Scores of refugees starved to death - MSF' => 'http://www.bbc.com/news/world-africa-36603419',
    'Euro 2016: Wales v Northern Ireland, England v Iceland & Republic of Ireland v France in last 16' => 'http://www.bbc.com/sport/football/36602266',
    'Jamie Vardy: Leicester City striker agrees new contract' => 'http://www.bbc.com/sport/football/36606270',
    "First bid for McDonald's China franchises confirmed" => 'http://www.bbc.com/news/business-36603779',
    "US election: Donald Trump's five lines of attack on Clinton" => 'http://www.bbc.com/news/world-us-canada-36592975',
    'Gun-control protest sparks chaotic scenes in US Congress' => 'http://www.bbc.com/news/world-us-canada-36598736',
    'Kim says North Korean missiles can reach US in Pacific' => 'http://www.bbc.com/news/world-asia-36603416',
  }

data_articles.each do |title, url|
  Article.create(
    title: title,
    user_id: [user1, user2].sample.id,
    url: url
  )
end
