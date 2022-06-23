class AddStatusToSeats < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :status, :boolean, default: false
  end
end
