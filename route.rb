class Route
  attr_accessor :all_stations
  def initialize(start_staition, finish_station)
    @all_stations =[start_staition, finish_station]
  end
  def add_staition (new_station)
    #не используем метод all_stations= потому что он будет менять
    # последнюю стнацию маршрута
    @all_stations.insert(1, new_station)
    @all_stations.uniq!
  end
  def delete_station(station_del)
    all_stations.each do |station|
      @all_stations.delete(station) if station == station_del
    end
  end
end
#    Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута,
# а промежуточные могут добавляться между ними.
#     Может добавлять промежуточную станцию в список
#     Может удалять промежуточную станцию из списка
#     Может выводить список всех станций по-порядку от начальной до конечной