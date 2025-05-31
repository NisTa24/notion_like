# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
page = Page.create

blocks = [
  { type: "Block::Heading", attributes: { level: 1, content: "Welcome to Rails Wonderland" } },
  { type: "Block::Text", attributes: { content: "Once upon a time, in a land full of gems, there was a brave developer named Ruby." } },
  { type: "Block::Heading", attributes: { level: 2, content: "The Quest for the Perfect Gem" } },
  { type: "Block::Text", attributes: { content: "Ruby embarked on a quest to find the perfect gem, one that would solve all N+1 queries." } },
  { type: "Block::Heading", attributes: { level: 3, content: "Enter the Realm of Active Record" } },
  { type: "Block::Text", attributes: { content: "In the mystical realm of Active Record, Ruby learned the ancient art of associations." } },
  { type: "Block::Heading", attributes: { level: 3, content: "The Trials of Migration" } },
  { type: "Block::Text", attributes: { content: "With every migration, Ruby grew stronger, mastering the power of schema changes." } },
  { type: "Block::Text", attributes: { content: "And thus, the legend of Ruby and the Rails was born, inspiring developers across the world." } }
]

blocks.each do |block_data|
  blockable = block_data[:type].constantize.create(block_data[:attributes])

  Block.create(page: page, blockable: blockable)
end
