class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :item_comments, dependent: :destroy
  has_many :knowledges, dependent: :destroy
  has_many :knowledge_comments, dependent: :destroy
  has_many :knowledge_goods, dependent: :destroy
  has_many :knowledge_gooded_knowledges, through: :knowledge_goods, source: :knowledge

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :os_type

  with_options presence: true do
    validates :nickname, :birthday

    validates :phone_namber, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only half-width namber' },
                             length: { minimum: 10, message: 'is too short' },
                             uniqueness: { case_sensitive: true }

    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
      validates :last_name, :first_name
    end

    with_options format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' } do
      validates :last_name_kana, :first_name_kana
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers',
                                 on: :create
end
