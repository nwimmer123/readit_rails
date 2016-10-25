class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  
  def set_user(user)
    self.user_id = user.id 
    self.save    
  end


 #AWS SECRET KEYS
 # Access Key ID: AKIAIELV5TFJRVCNDCSA
 # Secret Access Key: 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
  
end

