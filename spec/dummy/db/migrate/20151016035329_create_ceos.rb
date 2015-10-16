class CreateCeos < ActiveRecord::Migration
  def change
    create_table :ceos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
