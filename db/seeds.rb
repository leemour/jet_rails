# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def flight_gen(dep_from_dt, dep_to_dt, arr_to_dt)
  dep_from_dt = DateTime.parse(dep_from_dt).to_time
  dep_to_dt = DateTime.parse(dep_to_dt).to_time
  arr_to_dt = DateTime.parse(arr_to_dt).to_time

  depart = Time.at((dep_to_dt.to_f - dep_from_dt.to_f)*rand + dep_from_dt.to_f).to_s[0..-7]
  arrive = Time.at((arr_to_dt.to_f - depart.to_f)*rand + depart.to_f).to_s[0..-7]
  flight = rand(1000).to_s.rjust(4, '0')
  routing = 'Route ' + rand(13..100).to_s
  first_class = rand(100) * 10
  coach = rand(100) * 5
  {depart: depart, arrive: arrive, flight_num: flight, routing: routing,
   first_class: first_class, coach: coach}
end

depart_from = '2012-09-27 00:00:00'
depart_to = '2012-10-02 00:00:00'
arrive_to = '2012-10-03 00:00:00'
flights = []
20.times { flights << flight_gen(depart_from, depart_to, arrive_to) }
#puts flights

flights.each do |flight|
  Flight.create!(flight)
end