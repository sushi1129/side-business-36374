class Knowledge < ApplicationRecord
  belongs_to :user
  has_many :knowledge_comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  with_options presence: true do
    validates :knowledge_title, :knowledge_info, :image
  end
end
