class Categorization < ActiveRecord::Base
  validates_presence_of :book_id
  validates_presence_of :category_id

  belongs_to :book
  belongs_to :category
end
