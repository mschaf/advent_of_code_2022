RSpec.describe 'Day 12' do

  let(:example_input) { <<~INPUT }
    Sabqponm
    abcryxxl
    accszExk
    acctuvwj
    abdefghi
  INPUT

  describe 'Part 1' do
    it 'complies with the example from the instructions' do
      mock_input(example_input)
      expect(Runner.new(day: 12, part: 1).run).to eq 31
    end

    it 'has a solution' do
      expect(Runner.new(day: 12, part: 1).run).to eq 517
    end
  end

  describe 'Part 2' do
    it 'complies with the example from the instructions' do
      mock_input(example_input)
      expect(Runner.new(day: 12, part: 2).run).to eq 29
    end

    it 'has a solution' do
      expect(Runner.new(day: 12, part: 2).run).to eq 512
    end
  end

end
