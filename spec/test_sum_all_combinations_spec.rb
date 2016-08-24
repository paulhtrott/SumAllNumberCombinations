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

    it "should raise error if string passed in" do
      expect{ SumAllCombinations.new('house') }.to raise_error(ArgumentError, "SumAllCombinations initializer param must be an Array")
    end
    
    it "should raise error if nil passed in" do
      expect{ SumAllCombinations.new(nil) }.to raise_error(ArgumentError, "SumAllCombinations initializer param must be an Array")
    end

    it "should raise error if numeric passed in" do
      expect{ SumAllCombinations.new(1) }.to raise_error(ArgumentError, "SumAllCombinations initializer param must be an Array")
    end
  end

  context "multi-dimensional arrays" do
    it "original multi-dimension array should be flattened" do
      nums = SumAllCombinations.new([2,[3,4],5,[6,7,8,9,10]])
      expect(nums.original).to eq([2,[3,4],5,[6,7,8,9,10]])
      expect(nums.flattened).to eq([2,3,4,5,6,7,8,9,10])
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
      nums.sum(remove_duplicates: true)
      expect(nums.calculated_values).to eq([3,4,5,6,7,8,9,10])
    end
   
    it "should not sort if sort set to false" do
      nums = SumAllCombinations.new([1,2,3,4])
      nums.sum(remove_duplicates: true, sort: false)
      expect(nums.calculated_values).to eq([10, 6, 7, 3, 8, 4, 5, 9])
    end
 
    it "should set combinations used" do 
      nums = SumAllCombinations.new([1,2,3])
      nums.sum
      expect(nums.combinations_used).to eq(["1.0+2.0+3.0=6.0", "1.0+2.0=3.0", "1.0+3.0=4.0", "2.0+3.0=5.0"])
    end

    it "should return nil for combinations used if empty array is supplied" do
      nums = SumAllCombinations.new([])
      nums.sum
      expect(nums.combinations_used).to eq(nil)
    end

    it "should return empty array for calculated value if empty array is supplied" do
      nums = SumAllCombinations.new([])
      nums.sum
      expect(nums.calculated_values).to eq(nil)
    end

    it "should only calculate on numeric values" do
      nums = SumAllCombinations.new(["paul", 1, 2, 3, "fred"])
      nums.sum
      expect(nums.calculated_values).to eq([3.0,4.0,5.0,6.0])
    end

    it "should calculate with string numeric values" do
      nums = SumAllCombinations.new(["paul", "1.5", 2, 3, "fred"])
      nums.sum
      expect(nums.calculated_values).to eq([3.5,4.5,5,6.5])
    end
  end

end
