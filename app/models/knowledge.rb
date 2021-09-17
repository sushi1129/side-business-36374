class Knowledge < ApplicationRecord
  belongs_to :user
  has_many :knowledge_comments
  has_one_attached :image

  with_options presence: true do
    validates :knowledge_title, :knowledge_info, :image
  end
end
