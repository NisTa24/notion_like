class Block::Heading < ApplicationRecord
  has_one :block, as: :blockable, dependent: :destroy

  validates :level, inclusion: { in: 1..6 }
end
