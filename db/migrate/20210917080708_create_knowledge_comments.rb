class CreateKnowledgeComments < ActiveRecord::Migration[6.0]
  def change
    create_table :knowledge_comments do |t|

      t.timestamps
    end
  end
end
