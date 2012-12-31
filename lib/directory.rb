# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'rubygems'
require 'fastercsv'
require 'person'

class Directory
  
  def initialize
    @people = Hash.new
  end

  def add(person)
    @people[person.id] = person
  end

  def print
    @people.each_value { |person|
      puts "#{person}\n"
    }
  end

  def list
    @people
  end

  def get(id)
    @people[id]
  end

  def length
    @people.length
  end

  def store
    csv_file_path = File.join(File.dirname(__FILE__), "../directory.csv")
    FasterCSV.open(csv_file_path, "w") do |csv|
      csv << %w[id fname lname]
      @people.each { |k, v|
        csv << [v.id.to_s, v.fname, v.lname]
      }
    end
  end
  
  def load
    csv_file_path = File.join(File.dirname(__FILE__), "../directory.csv")
    if File.exist?(csv_file_path)
      FasterCSV.foreach( csv_file_path, :headers           => true,
                                        :header_converters => :symbol,
                                        :converters        => :numeric ) do |line|
        person = Person.new(line[:fname], line[:lname], line[:id])
        @people[person.id] = person
      end
    end
  end

  #Seed with sample data
  def seed
    @people[1] = Person.new("Seshu", "Adunuthula", 1)
    @people[2] = Person.new("Vasu", "Adunuthula", 2)
    @people[3] = Person.new("Seshu", "Mohan", 3)
  end

  def destroyStore
    csv_file_path = File.join(File.dirname(__FILE__), "../directory.csv")
    File.delete(csv_file_path)
  end
end
