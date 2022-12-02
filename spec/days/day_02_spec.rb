RSpec.describe 'Day 2' do

  describe 'Part 1' do
    it 'has a solution' do
      expect(Runner.new(day: 2, part: 1).run).to eq 13675
    end
  end

  describe 'Part 2' do
    it 'has a solution' do
      expect(Runner.new(day: 2, part: 2).run).to eq 14184
    end
  end

end
