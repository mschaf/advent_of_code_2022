RSpec.describe 'Day 5' do

  describe 'Part 1' do
    it 'has a solution' do
      expect(Runner.new(day: 5, part: 1).run).to eq 'CFFHVVHNC'
    end
  end

  describe 'Part 2' do
    it 'has a solution' do
      expect(Runner.new(day: 5, part: 2).run).to eq 'FSZWBPTBG'
    end
  end

end
