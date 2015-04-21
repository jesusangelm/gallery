namespace :recreator do
  desc "Regenera las imagenes miniaturas para nuevas dimensiones"
  task :recreate_versions do
    Picture.find_each do |pic|
      pic.image.recreate_versions!
    end
  end
end
