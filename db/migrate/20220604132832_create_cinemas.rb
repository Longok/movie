class CreateCinemas < ActiveRecord::Migration[6.1]
  def change
    create_table :cinemas do |t|
      t.string :name
      t.integer :year
      t.integer :time

      t.timestamps
    end
  end
end
