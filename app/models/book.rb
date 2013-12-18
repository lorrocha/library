class Book < ActiveRecord::Base
  validates_presence_of :title

  has_many :categorizations
  has_many :categories, :through => :categorizations

end
