RSpec.describe 'Day 6' do

  describe 'Part 1' do
    it 'complies with example 1' do
      mock_input('bvwbjplbgvbhsrlpgdmjqwftvncz')
      expect(Runner.new(day: 6, part: 1).run).to eq 5
    end

    it 'complies with example 2' do
      mock_input('nppdvjthqldpwncqszvftbrmjlhg')
      expect(Runner.new(day: 6, part: 1).run).to eq 6
    end

    it 'complies with example 3' do
      mock_input('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg')
      expect(Runner.new(day: 6, part: 1).run).to eq 10
    end

    it 'complies with example 4' do
      mock_input('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw')
      expect(Runner.new(day: 6, part: 1).run).to eq 11
    end

    it 'has a solution' do
      expect(Runner.new(day: 6, part: 1).run).to eq 1210
    end
  end

  describe 'Part 2' do
    it 'has a solution' do
      expect(Runner.new(day: 6, part: 2).run).to eq 3476
    end
  end

end
