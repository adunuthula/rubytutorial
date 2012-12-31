# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'lib/directory'
require 'lib/person'

describe Directory do

  #Seed the directory with a few people
  before :all do
    directory = Directory.new

    directory.add(Person.new("Seshu", "Adunuthula", 1))
    directory.add(Person.new("Vasu", "Adunuthula", 2))
    directory.add(Person.new("Seshu", "Mohan", 3))

    directory.store
  end

  before :each do
    @directory = Directory.new
    @directory.load
  end

  describe "Load:" do
    it "Should load the directory with 3 people" do
      @directory.length.should eql 3
    end

    it "Should check for a specific Person" do
      @directory.get(1).fname.should eql "Seshu"
    end
  end

  describe "Add:" do
    it "Should add more people and store" do
      @directory.add(Person.new("Varun", "Adunuthula", 4))
      @directory.add(Person.new("Aruna", "Adunuthula", 5))
      @directory.store
      @directory.length.should eql 5
    end

    it "Should reload the directory and check" do
      @directory.length.should eql 5
    end
  end

  after :all do
    dir = Directory.new
    dir.destroyStore
  end
end
  