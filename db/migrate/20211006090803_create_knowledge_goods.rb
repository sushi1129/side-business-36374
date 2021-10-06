class CreateKnowledgeGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :knowledge_goods do |t|
      t.references :user, null: false, foreign_key: true
      t.references :knowledge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
