RSpec.describe 'Day 8' do

  let(:example_input) { <<~INPUT }
    30373
    25512
    65332
    33549
    35390
  INPUT

  describe 'Part 1' do
    it 'complies with the example from the instructions' do
      mock_input example_input
      expect(Runner.new(day: 8, part: 1).run).to eq 21
    end

    it 'has a solution' do
      expect(Runner.new(day: 8, part: 1).run).to eq 1816
    end
  end

  describe 'Part 2' do
    it 'complies with the example from the instructions' do
      mock_input example_input
      expect(Runner.new(day: 8, part: 2).run).to eq 8
    end

    it 'has a solution' do
      expect(Runner.new(day: 8, part: 2).run).to eq 383520
    end
  end

end
