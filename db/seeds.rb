require 'faker'
require 'date'

puts "destroying all Studios"
Studio.destroy_all

puts "destroying all Rooms"
Room.destroy_all

puts "destroying all bookings"
Booking.destroy_all

puts "destroying all reviews"
Review.destroy_all

puts "destroying all users"
User.destroy_all 

puts "create user"
antoine = User.create! :email => 'antoine@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Antoine', :last_name => 'Goeuriot'
tanguy = User.create! :email => 'tanguy@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Tanguy', :last_name => 'Clarence'
delphine = User.create! :email => 'delphine@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Delphine', :last_name => 'Ha1bert'
rodolphe = User.create! :email => 'rodolphe@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Rodolphe', :last_name => 'Vacher'

puts "create studios"
studio_bleu = Studio.create! :name => 'Studio Bleu', :address => '7 rue des petites ecuries, 75010 Paris', :description => 'Studio bleu: location d espaces artistiques parisiens / 5 sites / 42 studios de répétition de musique : de 120 à 20 m2 / 15 halls de danse et de théatre : de 185 m2 à 40 m2 / une équipe professionnelle à votre écoute / une centrale de réservation pour les pros / du matériel de qualité pour vos répétitions et cours'
hf_music = Studio.create! :name => 'HF Music Studio', :address => '20-22 rue Richer, 75009 Paris', :description => 'La nouvelle référence pour vos répétitions. En plein cœur de Paris, ces studios de toute dernière génération, insonorisés, climatisés et équipés de matériel haut de gamme à votre disposition 7J/7.'
hbs = Studio.create! :name => 'Studios HBS', :address => '25 Avenue Corentin Cariou, 75019 Paris', :description => 'HBS Écuries est l un des premiers studios de répétitions musicales à ouvrir dans le centre de Paris et voilà désormais plus de trente ans que groupes et musiciens de tous styles (Jazz, Pop, Rock, Funk, Afro, Punk...), professionnels et amateurs, se succèdent dans nos locaux toujours en expansion.'
luna_rossa = Studio.create! :name => 'Luna Rossa', :address => '24 rue Primo Levi, 75013 Paris', :description => 'Créé en 1985 et situé dans le 13ème, le Studio Luna Rossa est le plus grand studio de répétitions de Paris. Après 3 déménagements, le studio est depuis 2011 situé au 24 rue Primo Lévi, au cœur d un arrondissement en pleine explosion artistique et culturelle.'

puts "create rooms"
room1 = Room.create! :name => 'Solo drumming', :description => 'Petite salle de répétition batterie', :capacity => 1, :price => 9, :studio_id => 1
room2 = Room.create! :name => 'Piano voix', :description => 'Salle de répétition pour piano et voix', :capacity => 2, :price => 12, :studio_id => 1
room3 = Room.create! :name => 'Electric standard', :description => 'Basse, guitare, batterie', :capacity => 5, :price => 14, :studio_id => 1
room4 = Room.create! :name => 'Full band', :description => 'Pour répétition d orchestres et fanfares', :capacity => 18, :price => 27, :studio_id => 1

room5 = Room.create! :name => 'Solo drumming', :description => 'Petite salle de répétition batterie', :capacity => 1, :price => 9, :studio_id => 2
room6 = Room.create! :name => 'Piano voix', :description => 'Salle de répétition pour piano et voix', :capacity => 2, :price => 12, :studio_id => 2
room7 = Room.create! :name => 'Electric standard', :description => 'Basse, guitare, batterie', :capacity => 5, :price => 14, :studio_id => 2
room8 = Room.create! :name => 'Full band', :description => 'Pour répétition d orchestres et fanfares', :capacity => 18, :price => 27, :studio_id => 2

room9 = Room.create! :name => 'Solo drumming', :description => 'Petite salle de répétition batterie', :capacity => 1, :price => 9, :studio_id => 3
room10 = Room.create! :name => 'Piano voix', :description => 'Salle de répétition pour piano et voix', :capacity => 2, :price => 12, :studio_id => 3
room11 = Room.create! :name => 'Electric standard', :description => 'Basse, guitare, batterie', :capacity => 5, :price => 14, :studio_id => 3
room12 = Room.create! :name => 'Full band', :description => 'Pour répétition d orchestres et fanfares', :capacity => 18, :price => 27, :studio_id => 3

room13 = Room.create! :name => 'Solo drumming', :description => 'Petite salle de répétition batterie', :capacity => 1, :price => 9, :studio_id => 4
room14 = Room.create! :name => 'Piano voix', :description => 'Salle de répétition pour piano et voix', :capacity => 2, :price => 12, :studio_id => 4
room15 = Room.create! :name => 'Electric standard', :description => 'Basse, guitare, batterie', :capacity => 5, :price => 14, :studio_id => 4
room16 = Room.create! :name => 'Full band', :description => 'Pour répétition d orchestres et fanfares', :capacity => 18, :price => 27, :studio_id => 4

puts "create bookings"
booking1 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user_id => 1, :room_id => 1
booking2 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user_id => 2, :room_id => 2
booking3 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user_id => 3, :room_id => 3
booking4 = Booking.create! :starts_at => DateTime.strptime("27/11/2020 17:00", "%d/%m/%Y %H:%M"), :duration => 120, :user_id => 4, :room_id => 4

puts "create reviews"
review1 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user_id => 1, :booking_id => 1 
review2 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user_id => 2, :booking_id => 2
review3 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user_id => 3, :booking_id => 3
review4 = Review.create! :title => 'Un bon moment', :content => 'Jai passé un bon moment avec mon groupe dans cette salle de repetition', :rating => 4, :user_id => 4, :booking_id => 4

puts "create items"
30.times do 
  Item.create! :name => Faker::Music.instrument, :description => 'Superbe instrument', :category => 'Instruments'
end 

puts "assigning items to rooms"
50.times do 
ItemsRoom.create! :room_id => rand(1..16), :item_id => rand(1..30)
end 