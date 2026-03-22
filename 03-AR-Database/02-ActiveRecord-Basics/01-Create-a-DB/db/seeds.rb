puts "Seeding..."

# TODO: add some code to fill the database with useful universal data
#

characters = [
  { name: "Alice", age: 30 },
  { name: "Bob", age: 25 },
  { name: "Charlie", age: 35 }
]


characters.each do |character_data|
  Character.create(character_data)
end

puts "Done."
