class KnowledgeComment < ApplicationRecord
  belongs_to :user
  belongs_to :knowledge
end
