RSpec.describe 'Day 7' do

  let(:example_input) { <<~INPUT }
    $ cd /
    $ ls
    dir a
    14848514 b.txt
    8504156 c.dat
    dir d
    $ cd a
    $ ls
    dir e
    29116 f
    2557 g
    62596 h.lst
    $ cd e
    $ ls
    584 i
    $ cd ..
    $ cd ..
    $ cd d
    $ ls
    4060174 j
    8033020 d.log
    5626152 d.ext
    7214296 k
  INPUT

  describe 'Part 1' do
    it 'complies wit the example from the instructions' do
      mock_input example_input
      expect(Runner.new(day: 7, part: 1).run).to eq 95437
    end

    it 'has a solution' do
      expect(Runner.new(day: 7, part: 1).run).to eq 1454188
    end
  end

  describe 'Part 2' do
    it 'complies wit the example from the instructions' do
      mock_input example_input
      expect(Runner.new(day: 7, part: 2).run).to eq 24933642
    end

    it 'has a solution' do
      expect(Runner.new(day: 7, part: 2).run).to eq 4183246
    end
  end

end
