
class SumAllCombinations
  attr_accessor :original
  attr_reader :flattened
  attr_reader :calculated_values
  attr_reader :combinations_used 
 
  def initialize(array_of_nums)
    @original = array_of_nums unless !array_of_nums.respond_to?('each')
    @flattened = @original.flatten unless @original.nil?
  end

  def original=(new_array)
    @original = new_array unless !new_array.respond_to?('each')
    @flattened = @original.flatten unless @original.nil?
  end
  
  def sum(remove_duplicates=false, sort=true)
    @combinations_used = []
    @calculated_values = []
    empty_array = []
    calculate(empty_array, @flattened, 0, 0) if !@flattened.nil?
    @calculated_values.uniq! if remove_duplicates
    @calculated_values.sort! if sort
  end

  private
  def calculate(current, array_to_use, index, accumulation)
    (index...array_to_use.length).each do |i|
      calculate(current + [array_to_use[i]], array_to_use, i + 1, accumulation + array_to_use[i])
    end
   @combinations_used.push("#{current.join('+')}=#{accumulation}") if current.size > 1
   @calculated_values.push(accumulation) if current.size > 1
  end  
end
