class Day7 < Day

  def initialize
    process_input
  end

  def part1
    directory_sizes.select { |size| size <= 100000 }.sum
  end

  def part2
    total_size = directory_size
    max_size = 40000000

    directory_sizes.sort.find do |size|
      size > total_size - max_size
    end
  end

  private

  def process_input
    @structure_hash = {}

    input_lines.slice_before { _1.start_with? '$ '}.each do |command, *response|
      _, command, args = command.split(' ', 3)

      case command
      when 'cd'
        process_cd(args)
      when 'ls'
        process_ls(response)
      else
        raise "unknown command #{command}"
      end
    end
  end

  def process_cd(args)
    if args.start_with?('/')
      @current_directory = args
    else
      @current_directory = File.join(@current_directory, args)
    end

    @current_directory = File.expand_path(@current_directory)
  end

  def process_ls(response)
    subject_directory = @structure_hash
    @current_directory.split('/').reject(&:empty?).each do |path_segment|
      subject_directory = subject_directory[path_segment]
    end

    response.each do |file_or_dir|
      size_or_dir, filename = file_or_dir.split(' ')
      subject_directory[filename] = size_or_dir == 'dir' ? {} : size_or_dir.to_i
    end
  end

  def directory_size(structure_hash = @structure_hash)
    structure_hash.sum do |_, contents|
      contents.is_a?(Hash) ? directory_size(contents) : contents
    end
  end

  def directory_list(structure_hash = @structure_hash, path = [], result = [])
    structure_hash
      .select { |_, content| content.is_a? Hash }
      .each { |name, contents| directory_list(contents, [*path, name], result) }
    result.append(path)
  end

  def directory_sizes
    directory_list.map do |path|
      structure = path.empty? ? @structure_hash : @structure_hash.dig(*path)
      directory_size(structure)
    end
  end

end
