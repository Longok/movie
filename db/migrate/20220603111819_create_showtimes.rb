class CreateShowtimes < ActiveRecord::Migration[6.1]
  def change
    create_table :showtimes do |t|
      t.datetime :time
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
