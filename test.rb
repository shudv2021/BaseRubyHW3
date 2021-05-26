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
puts "++++++++++++++//"
puts tr1.current_station.station_name
puts "весь маршрут полностью:"
route1.all_stations.each {|station| puts station.station_name}
puts "//////////////////////////////"
tr3 = Train.new('898', 'pasanger', 5)
tr4 = Train.new( '123', 'pasanger', 9)
tr5 = Train.new('777', 'cargo', 20)
tr3.sent_train(route1)
tr4.sent_train(route1)
tr5.sent_train(route1)

#сортировка по типу груза
#st1.show_by_type('cargo').each { |tr| puts tr.total_vagons}

tr1.move_back
tr1.move_forvard
tr1.move_forvard
tr1.move_forvard
tr1.move_forvard
tr1.move_forvard



puts tr1.prev_station.station_name if tr1.prev_station!=nil
puts tr1.current_station.station_name
puts tr1.next_station.station_name if tr1.next_station!=nil

puts '*****************************************************'
tr6=Train.new('678','pasanger', 8)
tr7 = Train.new('789','pasanger', 8)
st1.add_train(tr6)
st1.add_train(tr7)
tr6.sent_train(route1)
tr7.sent_train(route1)
st1.delete_train(tr6)

st1.all_trains.each { |train| puts train.train_num }
puts '*** *** *** **** '
puts st1.all_trains

st1.all_trains.each { |train| puts train.train_num }
puts '** ** ** ** '
st2.all_trains.each { |train| puts train.train_num }




