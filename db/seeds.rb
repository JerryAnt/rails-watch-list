
require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
# in url there are many pages to take into account (456) let's take 8
# info at the 'results catgory then an array then the infos I need'

puts "destroying existing movies..."
Movie.destroy_all
puts "creating new movies..."

20.times do |i|
  puts "Importing movies from page #{i + 1}"

movies_serialized = URI.open("#{url}?page=#{i + 1}").read
movies = JSON.parse(movies_serialized)

movies["results"].each do |movie|
  Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
  end
end
puts "Movies imported with success"






