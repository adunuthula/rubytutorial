# To change this template, choose Tools | Templates
# and open the template in the editor.

class Person
  attr_accessor :fname, :lname, :id

  def initialize(fname, lname, id)
    @fname = fname
    @lname = lname
    @id = id
  end

  def to_s
    @id.to_s + ": " + @lname + ", " + @fname
  end

  def to_json
    {'id' => @id, 'fname' => @fname, 'lname' => lname}.to_json
  end

  def self.find_by_fname(fname)
    found = nil
    ObjectSpace.each_object(Person) { |o|
      found = o if o.fname == fname
    }
    found
  end
end