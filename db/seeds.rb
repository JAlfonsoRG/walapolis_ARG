# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  {name: 'Negocios', description: '', fa_icon: 'fas fa-briefcase'},
  {name: 'Comunidad', description: '', fa_icon: 'fas fa-users'},
  {name: 'Cultura', description: '', fa_icon: 'fas fa-paint-brush'},
  {name: 'Educación', description: '', fa_icon: 'fas fa-graduation-cap'},
  {name: 'Eventos', description: '', fa_icon: 'fas fa-wine-glass'},
  {name: 'Salud', description: '', fa_icon: 'fas fa-notes-medical'},
  {name: 'Infraestructura', description: '', fa_icon: 'fas fa-road'},
  {name: 'Movilidad', description: '', fa_icon: 'fas fa-accesible-icon'},
  {name: 'Medio ambiente', description: '', fa_icon: 'fas fa-tree'},
  {name: 'Espacios publicos', description: '', fa_icon: 'fas fa-cubes'},
  {name: 'Seguridad', description: '', fa_icon: 'fas fa-shield-alt'}
])