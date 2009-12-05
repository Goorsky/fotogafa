namespace :db do
  desc "Wyczyść i zapełnij bazę danych"
  task :populate => :environment do
    require 'digest'
    require 'populator'
    require 'faker'
    require 'date'

    [Album].each(&:delete_all)

    p = Album.new
    p.id = 1
    p.title = "ZHR"
    p.description = "Album główny Związku Harcerstwa Rzeczypospolitej"
    p.parent_id = 0
    p.user_id = 1
    p.save(false)

    p = Album.new
    p.id = 2
    p.title = "Pozostałe"
    p.description = "Album zawierający pozostałe zdjęcia"
    p.parent_id = 0
    p.user_id = 1
    p.save(false)

    p = Album.new
    p.id = 3
    p.title = "Harcerze"
    p.description = "Album Organizacji Harcerze"
    p.parent_id = 1
    p.user_id = 1
    p.save(false)
    
    p = Album.new
    p.id = 4
    p.title = "Harcerki"
    p.description = "Album Organizacji Harcerek"
    p.parent_id = 1
    p.user_id = 1
    p.save(false)    

    p = Album.new
    p.id = 5
    p.title = "51 Szczecińska Drużyna Harcerzy \"Grom\""
    p.description = "Ponad XXX lat tradycji"
    p.parent_id = 3
    p.user_id = 1
    p.save(false)

    p = Album.new
    p.id = 6
    p.title = "8 Szczecińska Drużyna Harcerzy \"Płomień\""
    p.description = "To my"
    p.parent_id = 3
    p.user_id = 1
    p.save(false)    

    p = Album.new
    p.id = 7
    p.title = "Zlot XX-lecia"
    p.description = "Test"
    p.parent_id = 5
    p.user_id = 1
    p.save(false)

    p = Album.new
    p.id = 8
    p.title = "51 Szczecińska Drużyna Harcerek \"Wrzos\""
    p.description = "Test"
    p.parent_id = 4
    p.user_id = 1
    p.save(false)        
    
  end
end