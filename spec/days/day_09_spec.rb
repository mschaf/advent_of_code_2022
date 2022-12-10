RSpec.describe 'Day 9' do

  let(:example_input) { <<~INPUT }
    R 4
    U 4
    L 3
    D 1
    R 4
    D 1
    L 5
    R 2
  INPUT

  describe 'Part 1' do
    it 'complies with the example from the instructions' do
      mock_input(example_input)
      expect(Runner.new(day: 9, part: 1).run).to eq 13
    end

    it 'has a solution' do
      expect(Runner.new(day: 9, part: 1).run).to eq 5710
    end
  end

  let(:larger_example_input) { <<~INPUT }
    R 5
    U 8
    L 8
    D 3
    R 17
    D 10
    L 25
    U 20
  INPUT

  describe 'Part 2' do
    it 'complies with the example from the instructions' do
      mock_input(example_input)
      expect(Runner.new(day: 9, part: 2).run).to eq 1
    end

    it 'complies with the larger example from the instructions' do
      mock_input(larger_example_input)
      expect(Runner.new(day: 9, part: 2).run).to eq 36
    end

    it 'has a solution' do
      expect(Runner.new(day: 9, part: 2).run).to eq 2259
    end
  end

end
