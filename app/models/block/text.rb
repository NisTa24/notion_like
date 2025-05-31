class Block::Text < ApplicationRecord
  has_one :block, as: :blockable, dependent: :destroy
end
