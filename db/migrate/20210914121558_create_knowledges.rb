class CreateKnowledges < ActiveRecord::Migration[6.0]
  def change
    create_table :knowledges do |t|
      t.string     :knowledge_title, null: false
      t.text       :knowledge_info,  null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
