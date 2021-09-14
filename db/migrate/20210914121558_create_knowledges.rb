class CreateKnowledges < ActiveRecord::Migration[6.0]
  def change
    create_table :knowledges do |t|

      t.timestamps
    end
  end
end
