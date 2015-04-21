ActiveAdmin.register Picture do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :desc, :category_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :title
    column :desc
    column "image" do |pic|
      image_tag pic.image.url(:nano)
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Nueva Imagen", :multipart => true do 
      f.input :title
      f.input :desc
      f.input :category_id, :as => :select, :collection => Category.all
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url) 
      f.input :image_cache, :as => :hidden 
    end
    f.actions
  end

end
