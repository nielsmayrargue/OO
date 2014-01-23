require 'csv'

class CsvAccessor

  def initialize(file_name)
    @file_name = file_name
    CSV.open(@file_name, "a")
  end

  def save_a_row_in_csv(row)
    CSV.open(@file_name, "a+") do |csv|  
     csv << row 
    end
  end

  def read
    CSV.read(@file_name)
  end

  def save(saved_data)
    CSV.open(@file_name, "w") do |csv|  
     saved_data.each { |line| csv << line } 
    end
  end

end

