
class SumAllCombinations
  attr_accessor :original
  attr_reader :flattened
  attr_reader :calculated_values
  
  def initialize(array_of_nums)
    @original = array_of_nums unless !array_of_nums.respond_to?('each')
    @flattened = array_of_nums.flatten unless !array_of_nums.respond_to?('each')
  end

  def original=(new_array)
    @original = new_array unless !new_array.respond_to?('each')
    @flattened = new_array.flatten unless !new_array.respond_to?('each')
  end
  
  def sum(remove_duplicates=false)
    
  end

  def remove_duplicates

  end 
  
end
