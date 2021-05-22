class Train
  attr_reader :train_num, :type, :route, :current_station, :speed
  attr_accessor :total_vagons

  def initialize(train_num ='0000', type = 'cargo', total_vagons = 1)
    @train_num = train_num
    @type = type
    @total_vagons = total_vagons
    @route
    @current_station
    @speed = 0
  end
  def add_speed(add_sp)
    @speed += add_sp
  end
  def stop
    @speed = 0
  end
  def add_vagon
    @total_vagons += 1 if @speed == 0
  end
  def unhook
    @total_vagons -= 1 if @speed == 0
  end
  def sent_train(route)
    @route = route
    @current_station = route.all_stations[0]
    @current_station.all_trains.push(self)
  end
  def move(where)
    if where == 'forvard'
      shift = 1
    elsif where == 'back'
      shift = -1
    else
      puts ' Непониятно куда двигаться '
      shift = 0
    end
      @route.all_stations.each_with_index  do |station, station_num|
        if @current_station == station
          @current_station.all_trains.delete(self)
          @current_station = @route.all_stations[station_num + shift]
          @current_station.all_trains.push(self)
          break
        end
      end
      end
  def where_amI
    @route.all_stations.each_with_index do |station, station_num|
      if @current_station == station
        puts "Предидущая станция: #{@route.all_stations[station_num - 1].station_name}"
        puts "Текущая станция: #{station.station_name}"
        puts "Следующая станция: #{@route.all_stations[station_num + 1].station_name}"
      end
    end
  end
  #+Имеет номер (произвольная строка) и тип (грузовой, пассажирский)
  # +и количество вагонов, эти данные указываются при создании экземпляра класса
  # +Может набирать скорость
  # +Может возвращать текущую скорость
  # +Может тормозить (сбрасывать скорость до нуля)
  # +Может возвращать количество вагонов
  # +Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод
  # просто увеличивает или уменьшает количество вагонов).
  # Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  # +Может принимать маршрут следования (объект класса Route).
  # +При назначении маршрута поезду, поезд автоматически помещается на первую
  # +станцию в маршруте.
  # +Может перемещаться между станциями, указанными в маршруте. Перемещение возможно
  # +вперед и назад, но только на 1 станцию за раз.
  # +Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
end