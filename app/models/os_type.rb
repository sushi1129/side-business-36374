class OsType < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'iOS' },
    { id: 2, name: 'Android' }
  ]

  include ActiveHash::Associations
  has_many :users
end
