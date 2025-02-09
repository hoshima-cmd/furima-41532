class Category < ActiveHash::Base
  self.data = [
    { id: 1, num: '---' },
    { id: 2, num: '1～2日で発送' },
    { id: 3, num: '2～3日で発送' },
    { id: 4, num: '4～7日で発送' },
  ]
  
  include ActiveHash::Associations
  has_many :items
end