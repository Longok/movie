ActiveAdmin.register Film do
  permit_params :name, :year, :time, :image

  index do
    selectable_column
    column :id
    column :name
    column "Image" do |film|
      image_tag film.display_image, class: 'my_image_size'
      end
    column :year
    column :time
    actions
  end

  form do |f|
    f.inputs "Tạo phim mới" do
      f.input :name
      f.inputs do 
        f.input :image, as: :file
      end
      f.input :year
      f.input :time
    end
    f.actions
  end

end
