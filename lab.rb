class Train
  attr_reader :name
  def initialize
    @name = rand(11111..99999).to_s(36)
  end
end

texts = {}

10.times do |index|
  texts[('train'+(index+1).to_s).to_sym] = Train.new
end
puts texts[:train].name

