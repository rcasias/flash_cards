class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    @filename
    require 'pry'; binding.pry
  # end

end
