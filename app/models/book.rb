class Book < ActiveRecord::Base
  belongs_to :genre
  belongs_to :user
  has_many :reviews
end
