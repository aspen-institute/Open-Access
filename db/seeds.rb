# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

SystemSetting.create(name: 'title', value: 'Open Access')
SystemSetting.create(name: 'subtitle', value: 'Opportunities and resources for food business entrepreneurs.')
SystemSetting.create(name: 'banner', value: '')

Role.create(name: 'admin')
Role.create(name: 'editor')
