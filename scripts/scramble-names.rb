# anonymize student names for screenshots

Student.find_each do |s|
  s.update(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end