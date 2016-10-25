class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  
  def set_user(user)
    self.user_id = user.id 
    self.save    
  end

end

