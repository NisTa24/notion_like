class CreateBlocks < ActiveRecord::Migration[8.0]
  def change
    create_table :blocks do |t|
      t.belongs_to :page, null: false, foreign_key: true
      t.belongs_to :blockable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
