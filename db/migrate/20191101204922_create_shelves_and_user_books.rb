class CreateShelvesAndUserBooks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :shelves, :user_books, id: false do |t|
      
    end
  end
end
