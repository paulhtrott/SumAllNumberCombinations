describe SumAllCombinations do
  context "initializer" do
    it "original_array attribute should be empty array when initialized with an empty array" do
      nums = SumAllCombinations.new([])
      expect(nums.original).to eq([])
    end
    
    it "original_array attribute should be equal to array passed in" do
      nums = SumAllCombinations.new(['house', 'car', 1, 2])
      expect(nums.original).to eq(['house', 'car', 1, 2])
    end

    it "original_array attribute should be nil if array not passed in" do
      nums = SumAllCombinations.new('house')
      expect(nums.original).to eq(nil)

      nums = SumAllCombinations.new(1)
      expect(nums.original).to eq(nil)
    end
  end

  context "accessor of original_array" do
    it "original_array should equal value it is set to" do
      nums = SumAllCombinations.new(nil)
      expect(nums.original).to eq(nil)

      nums.original = ['house', 'car', 'toad', 3, 4]
      expect(nums.original).to eq(['house', 'car', 'toad', 3, 4])
    end
  end

  context "original multi-dimensional arrays will be flattened" do
    it "original multi-dimension array should be flattened" do
      nums = SumAllCombinations.new([2,[3,4],5,[6,7,8,9,10]])
      expect(nums.original).to eq([2,[3,4],5,[6,7,8,9,10]])
      expect(nums.flattened).to eq([2,3,4,5,6,7,8,9,10])

      nums.original = [11,[12,13,14], 15,16,17,[18,19]]
      expect(nums.original).to eq([11,[12,13,14], 15,16,17,[18,19]])
      expect(nums.flattened).to eq([11,12,13,14,15,16,17,18,19])
    end
  end
end
