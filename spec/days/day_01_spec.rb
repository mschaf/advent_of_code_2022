RSpec.describe 'Day 1' do

  describe 'Part 1' do
    it 'has a solution' do
      expect(Runner.new(day: 1, part: 1).run).to eq 69289
    end
  end

  describe 'Part 2' do
    it 'has a solution' do
      expect(Runner.new(day: 1, part: 2).run).to eq 205615
    end
  end

end
