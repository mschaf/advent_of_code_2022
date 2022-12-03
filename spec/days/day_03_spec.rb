RSpec.describe 'Day 3' do

  describe 'Part 1' do
    it 'has a solution' do
      expect(Runner.new(day: 3, part: 1).run).to eq 7997
    end
  end

  describe 'Part 2' do
    it 'has a solution' do
      expect(Runner.new(day: 3, part: 2).run).to eq 2545
    end
  end

end
