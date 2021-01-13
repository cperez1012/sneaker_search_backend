# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Category.destroy_all
Sneaker.destroy_all

User.create(name: "Christian Perez", username:"cperez1012", email: "cperez1012@gmail.com", password: "1234", image_url: "https://media-exp1.licdn.com/dms/image/C4D03AQEJIcRn6nUGcQ/profile-displayphoto-shrink_100_100/0/1600392836699?e=1616025600&v=beta&t=zVYfki1klJpnmYiqIrJtKzCK8Kzm_hYW_UccS-cbMJ0", bio: "I love Jordans!")

basketball = Category.create(name: "Basketball")
lifestyle = Category.create(name: "Lifestyle")
running = Category.create(name: "Running")

Sneaker.create(name: "Air Jordan 1 Retro High OG 'Pine Green 2.0'", description:"Released in early 2020, the Air Jordan 1 Retro High OG 'Pine Green 2.0' comes in a simple colorway of Pine Green and Gym Red on a black template. When Peter Moore designed the first Air Jordan in 1985, he wanted to provide support for the dynamic superstar with the freakishly athletic game—without sacrificing comfort. He designed a high-top shoe with durable leather featuring upper eyelet straps, heel and midfoot overlays, and a perforated toebox. The history of flight had begun.", image_url: "https://image.goat.com/crop/500/attachments/product_template_additional_pictures/images/032/436/952/original/496584_08.jpg.jpeg?1581012121", category_id: basketball.id)

t.string "name"
t.string "username"
t.string "email"
t.string "password_digest"
t.string "image_url"
t.string "bio"
t.datetime "created_at", precision: 6, null: false
t.datetime "updated_at", precision: 6, null: false