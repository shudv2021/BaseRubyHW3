class Route
  attr_accessor :all_stations
  def initialize(start_staition, finish_station)
    @all_stations =[start_staition, finish_station]
  end

  def add_staition (new_station)
    #не используем метод all_stations= потому что он будет менять
    # последнюю стнацию маршрута
    #break if @all_stations.include?(new_station) Invalid break (SyntaxError)
    # Как тогда выполнить прерывание метода по условию?
    if @all_stations.include?(new_station)
      puts "Такая станция уже есть на маршруте."
      #Я ведь могу добавлять вывод в методах если они должны что то сообщить
      else
      @all_stations.insert(1, new_station)
    end
  end

  def delete_station(station_del)
      @all_stations.delete(station) if station == station_del
  end
end
#    Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута,
# а промежуточные могут добавляться между ними.
#     Может добавлять промежуточную станцию в список
#     Может удалять промежуточную станцию из списка
#     Может выводить список всех станций по-порядку от начальной до конечной