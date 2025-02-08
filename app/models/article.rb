class CreateArticles < ActiveRecord::Migration[7.1]
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

end
