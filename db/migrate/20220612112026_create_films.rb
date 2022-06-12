class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :name
      t.integer :year
      t.integer :time

      t.timestamps
    end
  end
end
