class Item < ApplicationRecord
  belongs_to :user
  has_many :item_comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :item_goods, dependent: :destroy
  has_many :item_gooded_users, through: :item_goods, source: :user

  with_options presence: true do
    validates :item_name, :maker, :image, :bought_store

    validates :plice, inclusion: { in: 1..9_999_999, message: 'is out of setting range' },
                      format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' },
                      numericality: true
  end
end
