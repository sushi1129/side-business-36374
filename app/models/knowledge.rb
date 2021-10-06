class Knowledge < ApplicationRecord
  belongs_to :user
  has_many :knowledge_comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :knowledge_goods, dependent: :destroy
  has_many :knowledge_gooded_users, through: :knowledge_goods, source: :user

  with_options presence: true do
    validates :knowledge_title, :knowledge_info, :image
  end
end
