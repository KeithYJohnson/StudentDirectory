require 'rubygems' # require is a way of loading in libraries, a whole bunch of code we want to use
require 'yaml' # a way of storing structural data, probably don't have to gem install it.  

class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact
  attr_accessor :favplace
  attr_accessor :wherefrom

  def initialize(options = {}) #added in on 3.28, setting everything to lunch
    
    self.name = options[:name] #if you don't supply a name, it won't blow up
    self.email = options[:email]
  end


  def self.create_person(type)
    case type
      when "Student"
        Student.new
      when "Instructor"  
        Instructor.new
    end  
  end

  def questions
    print "What is your name? "
    self.name = gets.strip.chomp
    print "What is your email? "
    self.email = gets.strip.chomp
    print "What is your favorite place to eat in NYC?"
    self.favplace = gets.strip.chomp
    print "Where are you from?"
    self.wherefrom = gets.strip.chomp
    print "What is your github username?"
    self.github_user = gets.strip.chomp
    print "What is your Twitter handler?"
    self.twitter = gets.strip.chomp
    print "write a fun fact..."
    self.fun_fact = gets.strip.chomp
    

    
  end
  
end



class Student < Person
  attr_accessor :reason_for_joining

  def questions
    super
    puts "What are your reasons for joining?"
    self.reason_for_joining = gets.strip.chomp
  end
end

class Instructor < Person
  attr_accessor :type

  def questions
    super
    puts "What type of instructor are you?"
      self.type = gets.strip.chomp
  end
end

@directory = ""
puts "Student Directory, v0.0.1 by Dan Garland"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp)!="q") do 
  type = Person.create_person(input)
  type.questions



    
    # Append this to our yaml file
  @directory += type.to_yaml
  puts @directory
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
