# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Creating recipes...'
Recipe.create(name: "chicken curry", description: "a lovely chicken curry!", image_url:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-chicken-curry-aa22a0b.jpg?quality=90&webp=true&resize=440,400", rating:"8.8")
Recipe.create(name: "spaghetti carbonara", description: "an italian classic", image_url:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1001491_11-2e0fa5c.jpg?quality=90&webp=true&resize=440,400", rating:"9.2")
Recipe.create(name: "beans on toast", description: "simple but great", image_url:"https://user-images.immediate.co.uk/bbcgoodfood/recipes/user-recipe/untitled_16.bmp?quality=90&webp=true&resize=600,545", rating:"8.5")
Recipe.create(name: "chilli con carne", description: "the best chilli ever made", image_url:"https://www.hairybikers.com/uploads/images/_recipeImage/ChilliConCarne.jpg", rating:"9.0")

puts 'category seeds'
Category.create(name:"italian")
Category.create(name:"british")


require "open-uri"

file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg").open
article = Article.new(title: "NES", body: "A great console")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save
