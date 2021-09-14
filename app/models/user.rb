class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :os_type

  with_options presence: true do
    validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :prefecture_id, :phone_namber
  end
end
