class CreateShowtimes < ActiveRecord::Migration[6.1]
  def change
    create_table :showtimes do |t|
      t.time :time
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
