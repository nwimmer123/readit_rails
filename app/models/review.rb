class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  has_closure_tree order: 'created_at DESC'

end
