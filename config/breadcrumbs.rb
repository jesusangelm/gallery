crumb :root do
  link "Galeria", root_path
end

crumb :category do |category|
  link "Categoria: #{category.name.titleize}", category
  parent :root
end

crumb :picture do |picture, category|
  link "Viendo la imagen: #{picture.title.titleize}"
  parent :category, category
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
