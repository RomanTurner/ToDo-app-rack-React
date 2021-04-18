puts "Clearing old data..."
Category.destroy_all
Task.destroy_all


categories = [
    'All',
    'Code',
    'Food',
    'Money',
    'Misc'
]
puts "Seeding Categories..."
categories.each do |x|
Category.create(name: x)
end
# create categories

puts "Seeding tasks..."

# create tasks
20.times do 
Task.create(text: Faker::Books::Dune.quote, category_id: Category.ids.sample )
end 

puts "🌱 Done Seeding 🌱"