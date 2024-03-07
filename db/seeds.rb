# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

school = School.find_or_create_by!(name: 'Wunderkind', location: 'Gonduras')

school.classrooms.find_or_create_by!(number: 1, letter: 'A')
school.classrooms.find_or_create_by!(number: 2, letter: 'B')

20.times do
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    surname: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    school: school,
    classroom: school.classrooms.sample
  )
end
