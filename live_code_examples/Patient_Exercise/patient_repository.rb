require_relative "patient.rb"
require 'csv'

class PatientRepository
  # STATE
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1
    load_csv
  end

  # BEHAVIOR
  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i  # Convert data to Fixnum
      row[:cured] = row[:cured] == "true"  # Convert data to boolean
      new_patient = Patient.new(row)
      new_patient.room = @room_repo.find(row[:room_id].to_i)
      @patients << new_patient
    end
    @next_id = @patients.last.id + 1
  end
end

repo = PatientRepository.new("patients.csv")

alex = Patient.new(name: "alex", cured: true)
ed = Patient.new(name: "ed")

repo.add(alex)
repo.add(ed)

p repo
