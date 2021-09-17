class KnowledgeComment < ApplicationRecord
  belongs_to :user
  belongs_to :knowledge

  validates :text, presence: true
end
