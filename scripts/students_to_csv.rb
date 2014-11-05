#usage: `rails runner students_to_csv.rb`
require 'CSV'

CSV.open('students.csv', "w") do |csv, args|
  csv << Student.attribute_names
  Student.all.order(:last_name).each do |user|
    csv << user.attributes.values
  end
end