class Checkout < ActiveRecord::Base
  belongs_to :book
  validates_presence_of :book_id
  validates_presence_of :reader
end
