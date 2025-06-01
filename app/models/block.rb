class Block < ApplicationRecord
  belongs_to :page

  delegated_type :blockable, types: %w[Block::Text Block::Heading]
  accepts_nested_attributes_for :blockable

  def change_blockable_type(target_type, attributes = {})
    return false if blockable_type == target_type || target_type.blank?

    target_class = target_type.constantize
    current_blockable = blockable
    transferable_columns = target_class.column_names - [ "id", "created_at", "updated_at" ]
    transferable_attributes = current_blockable.attributes.slice(*transferable_columns)

    transferable_attributes.merge!(attributes) if attributes.present?

    transaction do
      replacement = target_class.create!(transferable_attributes)

      update!(blockable: replacement)

      current_blockable.destroy!
    end

    true
  end
end
