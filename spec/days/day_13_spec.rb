RSpec.describe 'Day 13' do

  let(:example_input) { <<~INPUT }
    [1,1,3,1,1]
    [1,1,5,1,1]
    
    [[1],[2,3,4]]
    [[1],4]
    
    [9]
    [[8,7,6]]
    
    [[4,4],4,4]
    [[4,4],4,4,4]
    
    [7,7,7,7]
    [7,7,7]
    
    []
    [3]
    
    [[[]]]
    [[]]
    
    [1,[2,[3,[4,[5,6,7]]]],8,9]
    [1,[2,[3,[4,[5,6,0]]]],8,9]
  INPUT

  describe 'Part 1' do
    it 'complies with the example from the instructions' do
      mock_input(example_input)
      expect(Runner.new(day: 13, part: 1).run).to eq 13
    end

    it 'has a solution' do
      expect(Runner.new(day: 13, part: 1).run).to eq 5557
    end
  end

  describe 'Part 2' do
    it 'complies with the example from the instructions' do
      mock_input(example_input)
      expect(Runner.new(day: 13, part: 2).run).to eq 140
    end

    it 'has a solution' do
      expect(Runner.new(day: 13, part: 2).run).to eq 22425
    end
  end

  describe '#compare_arrays' do
    subject { Day13.new }

    it 'can compare two integers' do
      aggregate_failures do
        expect(subject.compare_arrays(1, 1)).to eq 0
        expect(subject.compare_arrays(1, 2)).to eq 1
        expect(subject.compare_arrays(2, 1)).to eq -1
      end
    end

    it 'can compare two arrays' do
      aggregate_failures do
        expect(subject.compare_arrays([1], [1])).to eq 0
        expect(subject.compare_arrays([1], [2])).to eq 1
        expect(subject.compare_arrays([2], [1])).to eq -1
        expect(subject.compare_arrays([1, 1], [1, 1])).to eq 0
        expect(subject.compare_arrays([1, 1], [1, 2])).to eq 1
        expect(subject.compare_arrays([1, 2], [1, 1])).to eq -1
        expect(subject.compare_arrays([], [])).to eq 0
        expect(subject.compare_arrays([], [1])).to eq 1
        expect(subject.compare_arrays([1], [])).to eq -1
        expect(subject.compare_arrays([], [[]])).to eq 1
        expect(subject.compare_arrays([[[]]], [])).to eq -1
      end
    end

    it 'can compare arrays of different lengths' do
      aggregate_failures do
        expect(subject.compare_arrays([1, 1], [1])).to eq -1
        expect(subject.compare_arrays([1], [1, 1])).to eq 1
      end
    end

    it 'can compare nested arrays' do
      aggregate_failures do
        expect(subject.compare_arrays([[1],[2,3,4]], [[1],4])).to eq 1
        expect(subject.compare_arrays([[1, 1]], [[1, 1]])).to eq 0
        expect(subject.compare_arrays([[1, 1]], [[1, 2]])).to eq 1
        expect(subject.compare_arrays([[1, 2]], [[1, 1]])).to eq -1
      end
    end
  end

end
