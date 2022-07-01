ActiveAdmin.register Showtime do
    permit_params :time, :room
  
    index do
      selectable_column
      column :id
      column :time
      column :room
      column :created_at
      actions
    end
  
  end