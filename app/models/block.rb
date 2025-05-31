class Block < ApplicationRecord
  belongs_to :page

  delegated_type :blockable, types: %w[Block::Text Block::Heading]
  accepts_nested_attributes_for :blockable
end
