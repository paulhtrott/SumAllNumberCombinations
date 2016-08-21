class SumAllCombinations
  attr_accessor :original
  attr_reader :flattened
  attr_reader :calculated_values
  attr_reader :combinations_used 
 
  def initialize(array_of_nums)
    @original = array_of_nums if array_of_nums.respond_to?('each')
    @flattened = @original.flatten unless @original.nil?
  end

  def original=(new_array)
    @original = new_array if new_array.respond_to?('each')
    @flattened = @original.flatten unless @original.nil?
  end
  
  def sum(remove_duplicates=false, sort=true)
    @combinations_used = []
    @calculated_values = []
    empty_array = []
    clean_flattened_array() unless @flattened.nil?
    calculate(empty_array, 0, 0) unless @flattened.nil?
    @calculated_values.uniq! if remove_duplicates
    @calculated_values.sort! if sort
  end
  
  private
  def clean_flattened_array()
    @flattened.each do |i|
      @flattened.delete(i) if (Float(i).nil? rescue true)
    end
    
    new_array = []
    
    @flattened.each do |i|
      if i.class == String
        new_array.push(i.to_f)
      else 
        new_array.push(i)
      end
    end
    
    @flattened = new_array
  end  

  def calculate(current, index, accumulation)
    (index...@flattened.length).each do |i|
      calculate(current + [@flattened[i]], i + 1, accumulation + @flattened[i])
    end
   @combinations_used.push("#{current.join('+')}=#{accumulation}") if current.size > 1
   @calculated_values.push(accumulation) if current.size > 1
  end 

end
