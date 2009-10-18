class Average
  def initialize(sampler)
    @sampler = sampler
  end

  def average_of(number_of_readings)
    total = (0...number_of_readings).collect {
      @sampler.sample
    }.inject(0){ |result, element| result+element }
    total / number_of_readings.to_f
  end
end
