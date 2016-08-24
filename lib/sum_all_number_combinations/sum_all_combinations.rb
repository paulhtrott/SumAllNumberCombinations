class SumAllCombinations
  attr_accessor :original
  attr_reader :flattened, :calculated_values, :combinations_used 
 
  def initialize(array_of_nums)
    raise ArgumentError, "SumAllCombinations initializer param must be an Array" unless array_of_nums.is_a? Array
    @original = array_of_nums 
    @flattened = @original.flatten
  end

  def sum(remove_duplicates: false, sort: true)
    return if @flattened.nil? || @flattened.empty?
    @combinations_used = []
    @calculated_values = []
    @flattened = @flattened.map{ |i| i.to_f }.select{ |i| i != 0.0 }
    calculate([], 0, 0) 
    @calculated_values.uniq! if remove_duplicates
    @calculated_values.sort! if sort
  end
  
  private

  def calculate(current, index, accumulation)
    (index...@flattened.length).each do |i|
      calculate(current + [@flattened[i]], i + 1, accumulation + @flattened[i])
    end
   @combinations_used.push("#{current.join('+')}=#{accumulation}") if current.size > 1
   @calculated_values.push(accumulation) if current.size > 1
  end 

end
