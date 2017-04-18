class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  has_closure_tree order: 'created_at DESC'

  after_commit :send_email, on => :create

  def send_email

  end 

end
