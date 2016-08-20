describe SumAllCombinations do
  context "initializer" do
    it "original array attribute should be empty array when initialized with an empty array" do
      nums = SumAllCombinations.new([])
      expect(nums.original).to eq([])
    end
    
    it "original array attribute should be equal to array passed in" do
      nums = SumAllCombinations.new(['house', 'car', 1, 2])
      expect(nums.original).to eq(['house', 'car', 1, 2])
    end

    it "original array attribute should be nil if array not passed in" do
      nums = SumAllCombinations.new('house')
      expect(nums.original).to eq(nil)

      nums = SumAllCombinations.new(1)
      expect(nums.original).to eq(nil)
    end
  end

  context "accessor of original array" do
    it "original_array should equal value it is set to" do
      nums = SumAllCombinations.new(nil)
      expect(nums.original).to eq(nil)

      nums.original = ['house', 'car', 'toad', 3, 4]
      expect(nums.original).to eq(['house', 'car', 'toad', 3, 4])
    end
  end

  context "multi-dimensional arrays" do
    it "original multi-dimension array should be flattened" do
      nums = SumAllCombinations.new([2,[3,4],5,[6,7,8,9,10]])
      expect(nums.original).to eq([2,[3,4],5,[6,7,8,9,10]])
      expect(nums.flattened).to eq([2,3,4,5,6,7,8,9,10])

      nums.original = [11,[12,13,14], 15,16,17,[18,19]]
      expect(nums.original).to eq([11,[12,13,14], 15,16,17,[18,19]])
      expect(nums.flattened).to eq([11,12,13,14,15,16,17,18,19])
    end
  end

  context "sum" do
    it "should calculate the sum of all combinations of array values" do
      nums = SumAllCombinations.new([1,2,3])
      nums.sum
      expect(nums.calculated_values).to eq([3, 4, 5, 6])
    end

    it "should be using a flattened array" do 
      nums = SumAllCombinations.new([1,2,[3,4]])
      nums.sum
      expect(nums.calculated_values).to eq([3,4,5,5,6,6,7,7,8,9,10])
    end
  
    it "should not remove duplicates by default" do
      nums = SumAllCombinations.new([1,2,3,4])
      nums.sum
      expect(nums.calculated_values).to eq([3,4,5,5,6,6,7,7,8,9,10])
    end

    it "should remove duplicates is true passed in for remove_duplicates" do
      nums = SumAllCombinations.new([1,2,3,4])
      nums.sum(true)
      expect(nums.calculated_values).to eq([3,4,5,6,7,8,9,10])
    end
   
    it "should not sort if sort set to false" do
      nums = SumAllCombinations.new([1,2,3,4])
      nums.sum(true, false)
      expect(nums.calculated_values).to eq([10, 6, 7, 3, 8, 4, 5, 9])
    end
 
    it "should set combinations used" do 
      nums = SumAllCombinations.new([1,2,3])
      nums.sum
      expect(nums.combinations_used).to eq(["1+2+3=6", "1+2=3", "1+3=4", "2+3=5"])
    end

    it "should return empty array for combinations used if empty array is supplied" do
      nums = SumAllCombinations.new([])
      nums.sum
      expect(nums.combinations_used).to eq([])
    end

    it "should return empty array for calculated value if empty array is supplied" do
      nums = SumAllCombinations.new([])
      nums.sum
      expect(nums.calculated_values).to eq([])
    end

    it "should return empty array for calculated value if array is nil " do
      nums = SumAllCombinations.new(nil)
      nums.sum
      expect(nums.calculated_values).to eq([])
    end

    it "should return empty array for combinations used if array is nill" do
      nums = SumAllCombinations.new(nil)
      nums.sum
      expect(nums.combinations_used).to eq([])
    end
  end

end
