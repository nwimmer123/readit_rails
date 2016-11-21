class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def self.search(search)
    where("title ILIKE ? OR author ILIKE ? OR genre ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end

