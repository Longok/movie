ActiveAdmin.register Showtime do
    permit_params :time, :room_id, :film_id
  
    index do
      selectable_column
      column :id
      column :time
      column :film.name
      column :room
      column :created_at
      actions
    end
  
  end