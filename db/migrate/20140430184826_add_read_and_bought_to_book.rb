class AddReadAndBoughtToBook < ActiveRecord::Migration
  def change
  	add_column :books, :bought, :boolean
  	add_column :books, :read, 	:boolean
  end
end
