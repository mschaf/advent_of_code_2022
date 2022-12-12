class Generator

  def initialize(day:)
    @day = day
  end

  def run
    puts "Generating scaffold for day #{@day} ..."
    padded_day = @day.to_s.rjust(2, '0')

    day_file = "lib/days/day_#{padded_day}.rb"

    if File.exists? day_file
      puts "#{day_file} already exists, skipping ..."
    else
      File.write day_file, <<~RUBY
        class Day#{@day} < Day
  
          def part1
      
          end
  
          def part2
      
          end
  
        end
      RUBY
    end

    spec_file = "spec/days/day_#{padded_day}_spec.rb"
    if File.exists? spec_file
      puts "#{spec_file} already exists, skipping ..."
    else
      File.write spec_file, <<~RUBY
        RSpec.describe 'Day #{@day}' do

          let(:example_input) { <<~INPUT }
          
          INPUT
  
          describe 'Part 1' do
            it 'complies with the example from the instructions' do
              mock_input(example_input)
              expect(Runner.new(day: #{@day}, part: 1).run).to eq 0
            end

            it 'has a solution' do
              expect(Runner.new(day: #{@day}, part: 1).run).to eq 0
            end
          end
  
          describe 'Part 2' do
            it 'complies with the example from the instructions' do
              mock_input(example_input)
              expect(Runner.new(day: #{@day}, part: 2).run).to eq 0
            end

            it 'has a solution' do
              expect(Runner.new(day: #{@day}, part: 2).run).to eq 0
            end
          end
        
        end
      RUBY
    end

    puts "Generation complete!"
  end
end