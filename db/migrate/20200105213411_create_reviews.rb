class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.belongs_to :book
      t.belongs_to :user
    end
  end
end
