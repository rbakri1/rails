require 'csv'
require_relative "room.rb"

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    @next_id = 1
    load_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i  # Convert data to Fixnum
      row[:capacity] = row[:capacity].to_i  # Convert data to Fixnum
      @rooms << Room.new(row)
    end
    @next_id = @rooms.last.id + 1
  end
end

repo = RoomRepository.new("rooms.csv")
p repo
