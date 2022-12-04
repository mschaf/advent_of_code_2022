RSpec.describe 'Day 4' do

  describe 'Part 1' do
    it 'has a solution' do
      expect(Runner.new(day: 4, part: 1).run).to eq 511
    end
  end

  describe 'Part 2' do
    it 'has a solution' do
      expect(Runner.new(day: 4, part: 2).run).to eq 821
    end
  end

end
