RSpec.describe 'Day 11' do

  let(:example_input) { <<~INPUT }
    Monkey 0:
      Starting items: 79, 98
      Operation: new = old * 19
      Test: divisible by 23
        If true: throw to monkey 2
        If false: throw to monkey 3
    
    Monkey 1:
      Starting items: 54, 65, 75, 74
      Operation: new = old + 6
      Test: divisible by 19
        If true: throw to monkey 2
        If false: throw to monkey 0
  
    Monkey 2:
      Starting items: 79, 60, 97
      Operation: new = old * old
      Test: divisible by 13
        If true: throw to monkey 1
        If false: throw to monkey 3
  
    Monkey 3:
      Starting items: 74
      Operation: new = old + 3
      Test: divisible by 17
        If true: throw to monkey 0
        If false: throw to monkey 1
  INPUT


  describe 'Part 1' do
    it 'complies with the example from the instructions' do
      mock_input(example_input)
      expect(Runner.new(day: 11, part: 1).run).to eq 10605
    end

    it 'has a solution' do
      expect(Runner.new(day: 11, part: 1).run).to eq 78678
    end
  end

  describe 'Part 2' do
    it 'complies with the example from the instructions' do
      mock_input(example_input)
      expect(Runner.new(day: 11, part: 2).run).to eq 2713310158
    end

    it 'has a solution' do
      expect(Runner.new(day: 11, part: 2).run).to eq 15333249714
    end
  end

end
