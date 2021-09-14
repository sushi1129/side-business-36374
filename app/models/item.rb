class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, :maker, :image, :bought_store

    validates :plice, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' },
                      numericality: true
  end
end
