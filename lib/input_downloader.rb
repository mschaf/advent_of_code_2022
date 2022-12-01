require 'httparty'
require 'fileutils'

class InputDownloader

  INPUT_URL = 'https://adventofcode.com/2022/day/1/input'

  def initialize(day:)
    @day = day
  end

  def download_input
    padded_day = @day.to_s.rjust(2, '0')
    response = nil
    file_name = "input/day_#{padded_day}.txt"

    puts "Downloading input for day #{@day} ..."

    File.open(file_name, "wb") do |file|
      response = HTTParty.get(INPUT_URL, stream_body: true, headers: { 'Cookie': "session=#{session_token}"}) do |fragment|

        file.write(fragment)
      end
    end

    unless response&.code == 200
      FileUtils.rm_f(file_name)
      raise "Download failed. #{response&.body}"
    end

    puts "Download complete!"
  end

  private

  def session_token
    File.readlines('.session_token').first
  end

end