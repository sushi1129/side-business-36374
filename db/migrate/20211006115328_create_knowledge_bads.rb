class CreateKnowledgeBads < ActiveRecord::Migration[6.0]
  def change
    create_table :knowledge_bads do |t|
      t.references :user, null: false, foreign_key: true
      t.references :knowledge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
