# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# require "faker"
# 300.times do
#  Movie.find_or_create_by(title: Faker::Movie.title) do |movie|
#    movie.overview = Faker::Movie.quote
#    movie.rating = rand(0..5)
#  end
# end


require "open-uri"
require "json"
Movie.destroy_all
List.destroy_all

api_key = ENV["MOVIES_KEY"]
base_url = "https://api.themoviedb.org/3/movie/popular"
seed_url = "https://api.themoviedb.org/3/movie/"
(1..50).each do |page|
  url = "#{base_url}?api_key=#{api_key}&page=#{page}"
  puts "Fetching page #{page}..."

  begin
    response = URI.open(url).read
    data = JSON.parse(response)

    data["results"].each do |movie_data|
      next if movie_data["title"].blank?

      Movie.create!(
        title: movie_data["title"],
        overview: movie_data["overview"],
        poster_url: "https://image.tmdb.org/t/p/w500#{movie_data["poster_path"]}",
        rating: movie_data["vote_average"]
      )
    end

  end

end


twolist = URI.parse("https://i.pinimg.com/736x/df/0d/ed/df0ded888c426121cabcd5ac609b63d3.jpg").open
list2 = List.new(
  name:"Cartoon",
  description:"A fun-filled list of animated favorites—classic hits and hidden gems for all ages. Laugh, dream, and relive the magic of cartoons!"
)

list2.photo.attach(io: twolist, filename:"cartoon")
list2.save!

bookmark = Bookmark.new
bookmark.list = list2
bookmark.movie = Movie.find_by(title: "Hercules")
bookmark.save!
puts "Added Cartoon movie to Cartoon list"

bookmark = Bookmark.new
bookmark.list = list2
bookmark.movie = Movie.find_by(title: "Leo")
bookmark.save!
puts "Added Cartoon movie to Cartoon list"

bookmark = Bookmark.new
bookmark.list = list2
bookmark.movie = Movie.find_by(title: "Inside Out 2")
bookmark.save!
puts "Added Cartoon movie to Cartoon list"

threelist = URI.parse("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRn3DX6GLKfUYn1ZzBIe0LBUOhK9qiH7DezQ&s").open
list3 = List.new(
  name:"Action",
  description:"Get ready for heart-pounding chases, epic battles, and heroes who never back down. This list of action-packed movies delivers the ultimate dose of adrenaline, from blockbuster thrill rides to gritty underdog stories. Buckle up — it's going to be a wild ride."
)

list3.photo.attach(io: threelist, filename:"action")
list3.save!

bookmark = Bookmark.new
bookmark.list = list3
bookmark.movie = Movie.find_by(title: "Inside Out 2")
bookmark.save!
puts "Added Hero movie to Hero list"

bookmark = Bookmark.new
bookmark.list = list3
bookmark.movie = Movie.find_by(title: "Batman v Superman: Dawn of Justice")
bookmark.save!
puts "Added Hero movie to Hero list"

bookmark = Bookmark.new
bookmark.list = list3
bookmark.movie = Movie.find_by(title: "Super Papa")
bookmark.save!
puts "Added Hero movie to Hero list"


fourthlist = URI.parse("https://cdn.mos.cms.futurecdn.net/DqWtJvYf43VkKyzuYNg6mb-1200-80.jpg").open
list4 = List.new(
  name:"Harry Potter",
  description:"Join Harry, Hermione, and Ron on a timeless journey through the enchanted world of Hogwarts. From powerful spells to dark mysteries and epic battles, each film pulls you deeper into the magic. Get ready for a story of friendship, courage, and destiny that has captivated generations."
)

list4.photo.attach(io: fourthlist, filename:"harry potter")
list4.save!

bookmark = Bookmark.new
bookmark.list = list4
bookmark.movie = Movie.find_by(title: "Harry Potter and the Deathly Hallows: Part 2")
bookmark.save!
puts "Added Harry Potter movie to Harry Potter list"

bookmark = Bookmark.new
bookmark.list = list4
bookmark.movie = Movie.find_by(title: "Harry Potter and the Philosopher's Stone")
bookmark.save!
puts "Added Harry Potter movie to Harry Potter list"

bookmark = Bookmark.new
bookmark.list = list4
bookmark.movie = Movie.find_by(title: "Harry Potter and the Chamber of Secrets")
bookmark.save!
puts "Added Harry Potter movie to Harry Potter list"
