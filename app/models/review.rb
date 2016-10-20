class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  has_closure_tree
  
end
