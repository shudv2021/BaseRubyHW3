class Train
  attr_reader :train_num, :type, :route, :current_station, :speed, :where
  attr_accessor :total_vagons
  def initialize(train_num ='0000', type = 'cargo', total_vagons = 1)
    @train_num = train_num
    @type = type
    @total_vagons = total_vagons
    @route
    @where = {}
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

  def where_am_i
      num_current_station = @route.all_stations.index(@current_station)
      puts "#{num_current_station}"
      @where[:prev_station] = @route.all_stations[num_current_station - 1]
      @where[:current_station] = @current_station
      @where[:next_station] = @route.all_stations[num_current_station + 1]
      return @where
    end

  def move_back
    if @current_station == @route.all_stations[0]
      puts " Поезд находится на первой станции маршрута и не может двигаться назад. "
    else
      current_station
      @current_station.all_trains.delete(self)
      @current_station = @where[:prev_station]
      @current_station.all_trains.push(self)
      self.where_am_i
    end

  end

  def move_forvard
    if @current_station == @route.all_stations[-1]
    puts " Поезд находится на последней станции маршрута и не может двигаться вперед. "
    else
      @current_station.all_trains.delete(self)
      @current_station = @where[:next_station]
      @current_station.all_trains.push(self)
      self.where_am_i
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