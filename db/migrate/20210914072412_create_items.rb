class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,    null: false
      t.string     :maker,        null: false
      t.integer    :plice,        null: false
      t.string     :bought_store, null: false
      t.text       :item_info
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
