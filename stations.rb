class Station
  attr_reader :station_name
  attr_accessor :all_trains
  def initialize (station_name)
    @station_name = station_name
    @all_trains = []
  end

  def add_train(route)
    train = Train.new
   train.sent_train(route)
  end

  def send_train
    all_trains[0].move(all_trains[0].next_station)
  end

  def show_by_type(type)
    @all_trains.filter { |tr| tr.type == type}
  end
end

# +Может принимать поезда (по одному за раз)
# +Может возвращать список всех поездов на станции,
# +находящиеся в текущий момент
# +Может возвращать список поездов на станции по типу
# +(см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз,
# при этом, поезд удаляется из списка поездов, находящихся на станции).