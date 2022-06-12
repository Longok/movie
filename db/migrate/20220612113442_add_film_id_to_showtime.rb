class AddFilmIdToShowtime < ActiveRecord::Migration[6.1]
  def change
    add_column :showtimes, :film_id, :integer
  end
end
