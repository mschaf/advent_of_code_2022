module SpecHelpers

  def mock_input(input)
    allow_any_instance_of(Day).to receive(:input).and_return(input)
  end

end