class AddRoomIdToShowtimes < ActiveRecord::Migration[6.1]
  def change
    add_column :showtimes, :room_id, :integer
  end
end
