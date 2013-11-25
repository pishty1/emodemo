class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.text :listname

      t.timestamps
    end
  end
end
