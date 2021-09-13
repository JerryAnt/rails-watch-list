# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

require 'json'
require 'open-uri'



url = 'http://tmdb.lewagon.com/movie/top_rated'
# in url there are many pages to take into account (456) let's take 8
# info at the 'results catgory then an array then the infos I need'

8.times do|i|
  puts "Importing from page number #{i+1} /456 pages. This might take some time"
my_movies = JSON.parse(open("#{url}?page=#{i+1}").read)['results']

  my_movies.each do |mov|
    Movie.create(
      title: mov['title'],
      overview: mov['overview'],
      poster_url: "#{mov['base_url']}#{mov['backdrop_path']}",
      rating: mov['vote_average']
      )
  end
end
puts "Movies imported with success"
