class AddSpoilerToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :spoiler, :string
  end
end
