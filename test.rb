require('./route.rb')
require('./trains.rb')
require('./stations.rb')

st1 = Station.new('Krasnodar')
st2 = Station.new('Rostov')
st3 = Station.new('Voronezh')
st4 = Station.new('Moskov')
st5 = Station.new('Vladimir')
tr1 = Train.new
tr2 = Train.new('343', 'pasanger', 5)
puts tr1.train_num
puts tr2.type

route1=Route.new(st1, st5)
route1.add_staition(st4)
route1.add_staition(st3)
route1.add_staition(st2)


route1.all_stations.each { |station| puts station.station_name }
puts "**********-----**********"
route1.all_stations.each { |station| puts station.station_name }
tr1.sent_train(route1)
puts "++++++++++++++"
tr1.move('forvard')
tr1.move('forvard')
puts tr1.current_station.station_name
puts "------------------"
tr1.where_amI
route1.all_stations.each {|station| puts station.station_name}
puts "//////////////////////////////"
tr3 = Train.new('898', 'pasanger', 5)
tr4 = Train.new( '123', 'pasanger', 9)
tr5 = Train.new('777', 'cargo', 20)
tr3.sent_train(route1)
tr4.sent_train(route1)
tr5.sent_train(route1)

st1.show_by_type('pasanger')
puts "***************"
st1.show_all_trains


