class CreateItemComments < ActiveRecord::Migration[6.0]
  def change
    create_table :item_comments do |t|

      t.timestamps
    end
  end
end
