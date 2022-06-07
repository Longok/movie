class AddCinemaIdToShowtimes < ActiveRecord::Migration[6.1]
  def change
    add_column :showtimes, :cinema_id, :integer
  end
end
