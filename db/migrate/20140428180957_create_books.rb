class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :url
      t.string :title
      t.decimal :price_initial
      t.decimal :price_current
      t.string :isbn

      t.timestamps
    end
  end
end
