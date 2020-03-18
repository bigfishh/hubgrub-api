# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "rest-client"
# API_KEY = <YOUR_API_KEY>
# rm = RestClient.get("https://api.yelp.com/", {:Authorization => 'Bearer xn9utIeMQxJOGU-5WcfUk4iLJcu5BaaRsfTkXI3089gk1SFifLLEkBsO1vI_YoCUBJ8r5CszoYXLJxNF3x7JU2_5JYFJiuZcq7XnPmL0NBhKlp7Vf7DpR4IkqdBVXnYx'})
# byebug
require 'yelp/fusion'
require 'dotenv'
Dotenv.load

# # byebug

client = Yelp::Fusion::Client.new(ENV["YELP_API_KEY"])
response = client.search('New York City', term: 'restaurants')

Category.destroy_all
Restaurant.destroy_all
Item.destroy_all
Restitem.destroy_all


puts "creating categories"
    italian = Category.create(name: "Italian")
    hamburger = Category.create(name: "Hamburger")
    breakfast = Category.create(name: "Breakfast")
    bakery = Category.create(name: "Bakery")
    dessert = Category.create(name: "Dessert")
puts "finished creating categories"


puts "creating response.businesses"
response.businesses.each do |business|

    Category.create(name: business.categories[0].alias)

    Restaurant.create(
        category_id: Category.last.id, 
        name: business.name, 
        latitude: business.coordinates.latitude, 
        longitude: business.coordinates.longitude, 
        city: business.location.city, 
        state: business.location.state, 
        postal_code: business.location.zip_code, 
        street_address: business.location.address1, 
        price_rating: rand(1..5), 
        media_image: business.image_url
    )
end
puts "finished creating categories"



30.times do
    Item.create(
        name: "#{Faker::Food.dish}"
    )
end

20.times do
    Item.create(
        name: "#{Faker::Dessert.variety}"
    )
end

30.times do
    Item.create(
        name: "#{Faker::Food.sushi}"
    )
end

Restaurant.all.each do |restaurant|
    25.times do 
        Restitem.create(
            item_id: Item.all.sample.id, 
            restaurant_id: restaurant.id, 
            price: rand(10..20)
        )
    end
end

puts "destroying stuff"
    User.destroy_all
    # Order.destroy_all
    # Restaurant.destroy_all
    # Category.destroy_all
    # Item.destroy_all
    # Orderitem.destroy_all
puts "finished destroying stuff"

puts "creating users"
    annie = User.create(username: "anniebearr", password: "itsannie", img_url: "https://ca.slack-edge.com/T02MD9XTF-UQD06FQCR-9a4f8e24cee4-512")
puts "finished creating users"

# # puts "creating categories"
# #     italian = Category.create(name: "Italian")
# #     hamburger = Category.create(name: "Hamburger")
# #     breakfast = Category.create(name: "Breakfast")
# #     bakery = Category.create(name: "Bakery")
# #     dessert = Category.create(name: "Dessert")
# # puts "finished creating categories"

# puts "creating items"
#     #Bakery
#         bananaCreamPie = Item.create(name: "Banana Cream Pie")
#         chocolateChipCookie = Item.create(name: "Chocolate Chip Cookie")
#         keyLimePie = Item.create(name: "Key Lime Pie")

#     #Pizza/Italian
#         regularPizza = Item.create(name: "Round Cheese Pie")
#         margaritaPizza = Item.create(name: "Margarita Pizza")

#     #Breakfast/Bagels
#         fullBagel = Item.create(name: "Bagel with 2 Eggs, Meat and Cheese")
#         spreadBagel = Item.create(name: "Bagel with Flavored Spread")
#         loxBagel = Item.create(name: "Bagel with Cream Cheese and Lox")
#         bakedEggToast = Item.create(name: "Baked Egg Toast")
#         baconEggCheeseSandwich = Item.create(name: "Bacon Egg Cheese Sandwich")
#         roastedFiletofSalmon = Item.create(name: "Roasted Filet of Salmon")
    
#     #Dessert
#         bJNonDairyPBCookies = Item.create(name: "Ben & Jerry's Non-Dairy PB & Cookies")
#         bJMintCCookies = Item.create(name: "Ben & Jerry's Mint Chocolate Cookie")
#         bJTonightDough = Item.create(name: "Ben & Jerry's Tonight Dough")

# puts "finished creating items" 


# puts "creating restaurants"
#     #Italian/Pizza
#     frontStreetPizza = Restaurant.create(
#         category_id: italian.id, 
#         name: "Front Street Pizza", 
#         latitude: "40.702517", 
#         longitude: "-73.98951", 
#         city: "Brooklyn", 
#         state: "NY", 
#         postal_code: "11201", 
#         street_address: "80 Front St", 
#         price_rating: 3, 
#         media_image: "https://raster-static.postmates.com/?url=com.postmates.img.prod.s3.amazonaws.com/2bad2412-5f16-4d6a-b958-221afbcf343f/orig.jpg&quality=90&w=1500&h=900&mode=crop&format=jpg&v=4")
#         #Front Street Pizza Menu
#             frRP = Restitem.create(item_id: regularPizza.id, restaurant_id: frontStreetPizza.id, price: 17)
#             frMP = Restitem.create(item_id: margaritaPizza.id, restaurant_id: frontStreetPizza.id, price: 24)

#     ilPorto = Restaurant.create(
#         category_id: italian.id, 
#         name: "Il Porto", 
#         latitude: "40.69749", 
#         longitude: "-73.967711", 
#         city: "Brooklyn", 
#         state: "NY", 
#         postal_code: "11205", 
#         street_address: "37 Washington Ave", 
#         price_rating: 3, 
#         media_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTww_DftRtM-S5tc506DrIiA0TPoakSkoqvPZR3gBAOrx6Qs4JE")
#         #Il Porto Menu
#         ilMP = Restitem.create(item_id: margaritaPizza.id, restaurant_id: ilPorto.id, price: 20)

#     #Hamburgers
#     westville = Restaurant.create(
#         category_id: hamburger.id, 
#         name: "Westville", 
#         latitude: "40.701856", 
#         longitude: "-73.989651", 
#         city: "Brooklyn", 
#         state: "NY", 
#         postal_code: "11201", 
#         street_address: "81 Washington St", 
#         price_rating: 3, 
#         media_image: "https://media-cdn.tripadvisor.com/media/photo-s/0f/a8/d3/ea/plates.jpg")
    
#     #Breakfast
#     montagueBagels = Restaurant.create(
#         category_id: breakfast.id, 
#         name: "Montague Street Bagels", 
#         latitude: "40.694803",
#         longitude: "-73.995198",
#         city: "Brooklyn", 
#         state: "NY", 
#         postal_code: "11201", 
#         street_address: "108 Montague St", 
#         price_rating: 1, 
#         media_image: "https://res.cloudinary.com/grubhub/image/upload/v1462912493/rlpqnkhtotckjsmujobb.jpg")
#         #Montague Street Bagels Menu
#             monfB = Restitem.create(item_id: fullBagel.id, restaurant_id: montagueBagels.id, price: 6.5)
#             monsB = Restitem.create(item_id: spreadBagel.id, restaurant_id: montagueBagels.id, price: 5)
#             monlB = Restitem.create(item_id: loxBagel.id, restaurant_id: montagueBagels.id, price: 8.30)

#     archwayCafe = Restaurant.create(
#         category_id: breakfast.id, 
#         name: "Archway Cafe and Juice Bar", 
#         latitude: "40.7031696",
#         longitude: "-73.9875619",
#         city: "Brooklyn", 
#         state: "NY", 
#         postal_code: "11201", 
#         street_address: "57 Pearl St", 
#         price_rating: 3, 
#         media_image: "https://res.cloudinary.com/grubhub/image/upload/v1462383024/lmrpln7frsqs7ydzutgu.jpg")
#         #Archway Cafe and Juice Bar Menu
#             archBET = Restitem.create(item_id: bakedEggToast.id, restaurant_id: archwayCafe.id, price: 13.5)
#             archBECS = Restitem.create(item_id: baconEggCheeseSandwich.id, restaurant_id: archwayCafe.id, price: 10)
#             archSalmon = Restitem.create(item_id: roastedFiletofSalmon.id, restaurant_id: archwayCafe.id, price: 16)

#     #Bakery
#     miaBakery = Restaurant.create(
#         category_id: bakery.id, 
#         name: "Mia's Bakery", 
#         latitude: "40.687042",
#         longitude: "-73.990145",
#         city: "Brooklyn", 
#         state: "NY", 
#         postal_code: "11201", 
#         street_address: "139 Smith St", 
#         price_rating: 2, 
#         media_image: "https://res.cloudinary.com/grubhub/image/upload/v1478035422/j5bmdex8qbf3dnu6r1ww.png")
#         #Mia's Bakery Menu
#             miaBCP = Restitem.create(item_id: bananaCreamPie.id, restaurant_id: miaBakery.id, price: 6.25)
#             miaCCC = Restitem.create(item_id: chocolateChipCookie.id, restaurant_id: miaBakery.id, price: 3.5)
#             miaKLP = Restitem.create(item_id: keyLimePie.id, restaurant_id: miaBakery.id, price: 6.25)
#     #Dessert
#     theIceCreamShop = Restaurant.create(
#         category_id: dessert.id, 
#         name: "The Ice Cream Shop", 
#         latitude: "40.68939971",
#         longitude: "-73.97228241",
#         city: "Brooklyn", 
#         state: "NY", 
#         postal_code: "11205", 
#         street_address: "186 Dekalb Ave", 
#         price_rating: 1, 
#         media_image: "https://media-cdn.grubhub.com/image/upload/v1558448154/xhcficcvfbfx5qwxehsh.jpg")
#         #The Ice Cream Shop Menu
#             icePBCookies = Restitem.create(item_id: bJNonDairyPBCookies.id, restaurant_id: theIceCreamShop.id, price: 10.99)
#             iceCCC = Restitem.create(item_id: chocolateChipCookie.id, restaurant_id: theIceCreamShop.id, price: 7.99)
#             iceTD = Restitem.create(item_id: bJTonightDough.id, restaurant_id: theIceCreamShop.id, price: 7.99)
            
# puts "finished creating restaurants"

# puts "creating orders"
#     secondOrder = Order.create(user_id: annie.id, restaurant_id: miaBakery.id, checked_out: true)

# puts "finished creating orders"

# puts "creating orderitems"
#     sOOI1 = Orderitem.create(restitem_id: miaBCP.id, order_id: secondOrder.id, price: miaBCP.price)
#     sOOI2 = Orderitem.create(restitem_id: miaCCC.id, order_id: secondOrder.id, price: miaCCC.price)

# puts "finished creating orderitems"





