# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

puts "starting to seed..."

puts "removing existing records..."
User.destroy_all
Eatery.destroy_all
Cuisine.destroy_all
puts "existing records removed!"

puts "seeding users..."
users = [
  {
    email: 'grace@grace.com',
    password: 'grace123',
    first_name: 'Grace',
    last_name: 'Teng',
    phone_number: '12345678',
    protein: 150,
    carbs: 200,
    fats: 60
  },
  {
    email: 'zack@zack.com',
    password: 'zack123',
    first_name: 'Zack',
    last_name: 'Xu',
    phone_number: '23456789',
    protein: 180,
    carbs: 250,
    fats: 80
  },
  {
    email: 'allen@allen.com',
    password: 'allen123',
    first_name: 'Allen',
    last_name: 'Chung',
    phone_number: '34567890',
    protein: 180,
    carbs: 180,
    fats: 80
  },
  {
    email: 'steph@steph.com',
    password: 'steph123',
    first_name: 'Stephen',
    last_name: 'Das',
    phone_number: '45678901',
    protein: 200,
    carbs: 200,
    fats: 75
  }
]
users.each do |user|
  User.create!(user)
  puts "seeded user #{user[:email]}"
end
puts 'users seeded!'

#######
# TODO
#######
# seeded user meals should include
# one for "cheat day" -- med protein, high carbs, high fat
# one for "normal meal" - med protein, med carbs, low fat
# one for "post-workout meal" - high protein, med carbs, low fat
# one for "marathon training" - med protein, high carbs, low fat

puts 'seeding user meals...'
User.all.each do |user|
  meal_seeds = [
    {
      name: 'Normal',
      protein: 40,
      carbs: 80,
      fats: 30
    },
    {
      name: 'Post-Workout Meal',
      protein: 80,
      carbs: 80,
      fats: 30
    },
    {
      name: 'Marathon Training',
      protein: 50,
      carbs: 120,
      fats: 20
    },
    {
      name: 'Cheat Meal',
      protein: 30,
      carbs: 120,
      fats: 60
    }
  ]
  meal_seeds.each do |meal|
    new_meal = Macro.new(meal)
    new_meal.user = user
    new_meal.save
    puts "seeded #{user.first_name}'s #{meal.name}"
  end
end
puts 'user meals seeded!'

puts 'seeding cuisines...'
# cuisines = [
#   'Singaporean',
#   'Malaysian',
#   'Indonesian',
#   'Spanish',
#   'Japanese',
#   'Italian',
#   'British',
#   'American',
#   'Mexican',
#   'French',
#   'Chinese',
#   'Korean',
#   'Thai',
#   'Middle Eastern',
#   'Indian'
# ]
# cuisines.each do |cuisine|
#   Cuisine.create!(name: cuisine)
#   puts "seeded #{cuisine}"
# end
15.times do
  cuisine = Cuisine.create!(name: Faker::Restaurant.unique.type)
  puts "seeded #{cuisine.name}"
end
puts 'cuisines seeded!'

############
# TODO
############
# should have eateries in Shanghai
# should have eateries in Woodlands
# should have eateries in Tampines
# should have eateries in Orchard
# 5 eateries per location
# Orchard eateries should have nice logos
# Orchard eateries' food images should match their names
# Orchard eateries' food macros should match their names
# Orchard eateries' prices should match their names
# not using description any more
# There should be one eatery nearby (at 350 Orchard Road? Shaw?)
# that has a meal that matches the diabetic, strength athlete and cheat meal profiles

puts 'seeding eateries...'
addresses = [
  '350 Orchard Road, Singapore'
  '68 Orchard Road, Singapore',
  '8 Grange Road, Singapore',
  '2 Orchard Turn, Singapore',
  '14 Scotts Road, Singapore',
  '6A Admiralty Road, Singapore',
  '573 Woodlands Drive 16, Singapore',
  '1 Woodlands Square, Singapore',
  '39 Woodlands Close, Singapore',
  '354A Woodlands Avenue 5, Singapore',
  '10 Tampines Central 1, Singapore',
  '137 Tampines St 11, Singapore',
  '208A Tampines Ave 2, Singapore',
  '5 Tampines Ave 3, Singapore',
  '494 Tampines Street 45, Singapore',
  '18 Wanhangdu Rd, Jing\'an District, Shanghai, China',
  '5 Jiaozhou Rd, Jing\'an District, Shanghai, China',
  '87 Wuding Rd, Shanghai',
  '255 Yanping Rd, Jing\'an District, China',
  'Yuyuan Branch Rd, Jing\'an District, Shanghai, China',
]

logos = [
  'https://res.cloudinary.com/graceteng/image/upload/v1601565848/000_lettuce_leaf_logo_twcvho.png',
  'https://res.cloudinary.com/graceteng/image/upload/v1601565848/000_go_fish_logo_qcfrum.png',
  'https://res.cloudinary.com/graceteng/image/upload/v1601565848/000_pincer_movement_logo_ovx94l.png',
  'https://res.cloudinary.com/graceteng/image/upload/v1601565847/000_ox_tales_logo_rlot9r.png',
  'https://res.cloudinary.com/graceteng/image/upload/v1601565825/tea_logo_hxcubc.png',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_90692173-e1571110647786.png',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_93150414-e1571110566194.png',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_66602497-e1571115384951.jpg',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_92127945-e1571116006606.jpg',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/f87d59b6-c3df-4ce0-a9a2-073c8b98d2a8.jpg',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_89345375.jpg',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_77512603-e1571186033116.png',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/mugaritz-restaurant.jpg',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_57615794-e1571114994767.png',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_94283857-e1571185890515.jpg',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_102682959-e1571116039684.png',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_72730158-e1571110735270.png',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_89348086-e1571112998256.png',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_45092251.png',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/1d712e10-525a-4cc2-84f2-36e66336c0d0-e1571115090968.png'
]

names = [
  'The Lettuce Leaf',
  'Tea.',
  'Ox Tales',
  'Pincer Movement',
  'Go Fish'
]

15.times do
  names << Faker::Restaurant.unique.name
end

addresses.each_with_index do |address, index|
  eatery = Eatery.new
  eatery.name = names[index]
  eatery.address = address
  eatery.phone_number = "6#{Faker::Number.number(digits: 7)}"
  eatery.description = Faker::Restaurant.description
  eatery.save!

  file = URI.open(logos[index])
  content_type = "image/#{logos[index][-3, 3]}"
  eatery.photo.attach(io: file, filename: "logo#{index}.png", content_type: content_type)

  puts "seeded #{eatery.name}"
end
puts 'eateries seeded!'

puts 'seeding eatery-cuisine relationship...'
Eatery.all.each do |eatery|
  2.times do
    until eatery_cuisine = EateryCuisine.create(eatery: eatery, cuisine: Cuisine.all.sample)
      puts "finding a suitable cuisine for #{eatery.name}..."
    end
    puts "#{eatery.name} is a #{eatery_cuisine.cuisine.name} restaurant!"
  end
end
puts 'seeded eatery cuisines!'

puts 'seeding dishes...'

dish_images = [
  'CA2NgpLIqa0',
  'zcUgjyqEwe8',
  'ZuIDLSz3XLg',
  'MNtag_eXMKw',
  'IGfIGP5ONV0',
  '8Nc_oQsc2qQ',
  'w6ftFbPCs9I',
  'EvoIiaIVRzU',
  'jpkfc5_d-DI',
  'OFismyezPnY',
  'vzX2rgUbQXM',
  'jUPOXXRNdcA',
  'XoByiBymX20',
  'oaz0raysASk',
  'ennARkXrF74',
  'oT7_v-I0hHg',
  'CvLZ6hbIemI',
  's7FuT9HYoxM',
  'LCaBh7QSGr8',
  'O4CVzHODjjM'
]
dish_images.map! { |id| "https://source.unsplash.com/#{id}" }



Eatery.all.each do |eatery|
  next if names[0, 5].include?(eatery.name)
  10.times do
    dish = Dish.new
    dish.eatery = eatery
    dish.name = Faker::Food.unique.dish
    dish.price_cents = rand(100..4000)
    dish.protein = Faker::Number.between(from: 10, to: 60)
    dish.carbs = Faker::Number.between(from: 40, to: 120)
    dish.fats = Faker::Number.between(from: 15, to: 50)
    dish.description = Faker::Food.description
    dish.save!

    dish_image = dish_images.sample
    file = URI.open(dish_image)
    dish.photo.attach(io: file, filename: "dish#{dish.id}.png", content_type: 'image/png')

    puts "seeded dish #{dish.name}"
  end
  puts "seeded dishes for #{eatery.name}!"
  Faker::Food.unique.clear
end

lettuce_leaf_dishes = [
  {
    name: 'Caesar Salad',
    price_cents: 790,
    protein: 5,
    carbs: 10,
    fats: 14
  },
  {
    name: 'Impossible Salad',
    price_cents: 1290,
    protein: 17,
    carbs: 11,
    fats: 14
  },
  {
    name: 'Garden Salad',
    price_cents: 590,
    protein: 2,
    carbs: 10,
    fats: 5
  },
  {
    name: 'Tuna Salad',
    price_cents: 990,
    protein: 23,
    carbs: 7,
    fats: 15
  },
  {
    name: 'Shrimp Salad',
    price_cents: 990,
    protein: 16,
    carbs: 8,
    fats: 16
  },
  {
    name: 'Niçoise Salad',
    price_cents: 1090,
    protein: 27,
    carbs: 24,
    fats: 7
  }
]
lettuce_leaf_images = [
  'https://source.unsplash.com/R4QckNsg0sw',
  'https://source.unsplash.com/oj2hBf5TOFM',
  'https://source.unsplash.com/RNmibnLCJAA',
  'https://source.unsplash.com/ZwzZ5F_pIBU',
  'https://source.unsplash.com/w_z0RJCSBiE',
  'https://source.unsplash.com/PeyzQt7tMk0'
]
tea_dishes = [
  {
    name: 'Blueberry Cheesecake',
    price_cents: '590',
    protein: 9,
    carbs: 43,
    fats: 29
  },
  {
    name: 'Burnt Cheesecake',
    price_cents: '590',
    protein: 13,
    carbs: 40,
    fats: 30
  },
  {
    name: 'Scones',
    price_cents: '490',
    protein: 7,
    carbs: 45,
    fats: 16
  },
  {
    name: 'Signature Cupcake',
    price_cents: '690',
    protein: 3,
    carbs: 48,
    fats: 13
  },
  {
    name: 'Signature Hot Chocolate',
    price_cents: '650',
    protein: 10,
    carbs: 40,
    fats: 18
  },
  {
    name: 'Macaron',
    price_cents: '300',
    protein: 4,
    carbs: 28,
    fats: 11
  }
]
tea_images = [
  'https://source.unsplash.com/EbRBhZ-I_p8',
  'https://source.unsplash.com/xVLJ-JFTcQE',
  'https://source.unsplash.com/Kgcc8TKKEkg',
  'https://source.unsplash.com/UaeVmc51Ttw',
  'https://source.unsplash.com/MjZq7A2RJxQ',
  'https://source.unsplash.com/hV1gChgMa-k'
]
ox_tales_dishes = [
  {
    name: 'Beef Stew',
    price_cents: 1450,
    protein: 44,
    carbs: 33,
    fats: 37
  },
  {
    name: 'Beef Noodles',
    price_cents: 850,
    protein: 34,
    carbs: 48,
    fats: 28
  },
  {
    name: 'Beef Fried Rice',
    price_cents: 1150,
    protein: 33,
    carbs: 56,
    fats: 28
  },
  {
    name: 'Beef Burger',
    price_cents: 1450,
    protein: 43,
    carbs: 33,
    fats: 32
  },
  {
    name: 'Beef Steak',
    price_cents: 2850,
    protein: 39,
    carbs: 10,
    fats: 26
  },
  {
    name: 'Beef Tacos',
    price_cents: 1250,
    protein: 35,
    carbs: 27,
    fats: 25
  }
]
ox_tales_images = [
  'https://source.unsplash.com/xKSRpUH0VZo',
  'https://source.unsplash.com/l3Mr7vSdmd4',
  'https://source.unsplash.com/v8B1gN_QUbI',
  'https://source.unsplash.com/4hgYULBzVEE',
  'https://source.unsplash.com/ZLj6aVacbFo',
  'https://source.unsplash.com/z_PfaGzeN9E'
]
pincer_movement_dishes = [
  {
    name: 'Oysters',
    price_cents: 1890,
    protein: 79,
    carbs: 29,
    fats: 14
  },
  {
    name: 'Lobsters',
    price_cents: 2290,
    protein: 60,
    carbs: 5,
    fats: 3
  },
  {
    name: 'Squid with Ink',
    price_cents: 890,
    protein: 33,
    carbs: 2,
    fats: 8,
  },
  {
    name: 'Grilled Salmon',
    price_cents: 1190,
    protein: 38,
    carbs: 12,
    fats: 21,
  },
  {
    name: 'Grilled Prawns',
    price_cents: 990,
    protein: 46,
    carbs: 5,
    fats: 17,
  },
  {
    name: 'Mud Crab',
    price_cents: 1590,
    protein: 28,
    carbs: 2,
    fats: 2
  }
]
pincer_movement_images = [
  'https://source.unsplash.com/f7v_NofUBx0',
  'https://source.unsplash.com/OrTjocYe1b4',
  'https://source.unsplash.com/yArvCsvY_kM',
  'https://source.unsplash.com/bpPTlXWTOvg',
  'https://source.unsplash.com/TqOEGdRNowY',
  'https://source.unsplash.com/rXDCb-Bmgdg'
]
go_fish_dishes = [
  {
    name: 'Tuna Nigiri Sushi',
    price_cents: 950,
    protein: 40,
    carbs: 40,
    fats: 10
  },
  {
    name: 'Salmon Sashimi',
    price_cents: 1350,
    protein: 60,
    carbs: 2,
    fats: 20
  },
  {
    name: 'Philadelphia Roll',
    price_cents: 1350,
    protein: 28,
    carbs: 56,
    fats: 24
  },
  {
    name: 'Unagi Avocado Roll',
    price_cents: 1350,
    protein: 18,
    carbs: 76,
    fats: 14
  },
  {
    name: 'Sushi Platter',
    price_cents: 1850,
    protein: 50,
    carbs: 78,
    fats: 40
  },
  {
    name: 'Sashimi Platter',
    price_cents: 2250,
    protein: 117,
    carbs: 19,
    fats: 47
  }
]
go_fish_images = [
 'https://source.unsplash.com/F7lk3ju2ifQ',
  'https://source.unsplash.com/53_R7KNQ1WU',
  'https://source.unsplash.com/-1GEAA8q3wk',
  'https://source.unsplash.com/InCMGusiAvA',
  'https://source.unsplash.com/5KS7T3Gs3CA',
  'https://source.unsplash.com/JnFGgVaFpmE'
]

presentation_eateries = {
  names[0] => {
    dishes: lettuce_leaf_dishes,
    images: lettuce_leaf_images
  },
  names[1] => {
    dishes: tea_dishes,
    images: tea_images
  },
  names[2] => {
    dishes: ox_tales_dishes,
    images: ox_tales_images
  },
  names[3] => {
    dishes: pincer_movement_dishes,
    images: pincer_movement_images
  },
  names[4] => {
    dishes: go_fish_dishes,
    images: go_fish_images
  }
}

names[0, 5].each do |eatery_name|
  eatery = Eatery.find_by name: eatery_name
  presentation_eateries[eatery].dishes.each_with_index do |dish, index|
    new_dish = Dish.new(dish)
    new_dish.eatery = eatery
    dish.description = Faker::Food.description
    dish.save!

    dish_image = presentation_eateries[eatery].images[index]
    file = URI.open(dish_image)
    new_dish.photo.attach(io: file, filename: "dish#{new_dish.id}.png", content_type: 'image/png')
    puts "seeded #{new_dish.name}!"
  end
  puts "seeded all dishes for #{eatery_name}!"
end

puts 'seeded all dishes!'

puts 'seeding orders...'
User.all.each do |user|
  3.times do
    order = Order.new
    order.user = user
    order.dine_in = [true, false].sample
    order.save!
    puts "created an order for #{user.first_name}"
    random_presentation_eatery = names[0, 5].sample
    eatery = Eatery.find_by name: random_presentation_eatery
    (0..2).to_a.each do |index|
      order_dish = OrderDish.create!(
        order: order,
        dish: eatery.dishes[index],
        quantity: [1, 2, 3].sample
      )
      puts "added #{order_dish.dish.name} to order #{order.id}"
    end
    order.save!
    puts "ordered from #{eatery.name} for #{user.first_name}"
  end
  puts "seeded all orders for #{user.first_name}!"
end
puts 'seeded all orders!'

puts 'seeding all reviews...'
OrderDish.all.each do |order_dish|
  heads = [true, false].sample
  if heads
    Review.create!(
      order_dish: order_dish,
      content: Faker::Restaurant.review,
      rating: Faker::Number.between(from: 1, to: 5)
    )
    puts "created review for #{order_dish.dish.name} from order #{order_dish.order.id}"
  end
end
puts 'seeded all reviews!'

puts 'finished seeding!'
