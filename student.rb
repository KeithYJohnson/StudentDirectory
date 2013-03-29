#  Need to be able to add to the directory after the program is closed and then rebooted.  

# Eventually will be four files, one for: students, person, instructor, main
# require is a way of loading in libraries, a whole bunch of code we want to use
require 'rubygems' 
# yaml, a way of storing structural data, probably don't have to gem install it.  
require 'yaml'
# pry, can now put binding.pry anywhere, and when running student.rb, when the interpreter gets to its line, itll pause
# remember to delete the binding.pry's after your done with the code
require 'pry' 

class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact
  attr_accessor :favplace
  attr_accessor :wherefrom

  # def initialize(options = {}) 
    
  #   self.name = options[:name] 
  #   #if you don't supply a name, it won't blow up
  #   self.email = options[:email]
  # end


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

# can assign @directory to an empty array[] to make it easier to work with
@directory = [] 

puts "Student Directory, v0.0.1 by Dan Garland"
print "Enter Student or Instructor, l to load, q to save and quit: "

while ((input = gets.strip.chomp)!="q") do 
  if input =="l"
    @directory += YAML.load_documents(File.open('student_directory.yml'))
  else 
    type = Person.create_person(input)
    type.questions
    



      
    # Append this to our yaml file
    @directory.push type.to_yaml
    puts @directory
    print "Enter Student or Instructor, q to save and quit: "
  end
end

# Open a student_directory.yml YAML file and write it out on one line
File.open("student_directory.yml", 'a') { |f| f.write(@directory) } 

# when "l" # refers to a case statement with when "student" when "instructor"
# @directory += YAML.load_documents(File.open('student_directory.yml'))
# this will append itself to the end of the directory
# @directory <<person
# puts @directory
# print "Enter Student... l to load, q to save and quit"

# A closure - a piece of code we can define once
# but then use again and again, passing around 
# code as a variable in a sense

#File.open('student_directory.yml, 'w") {|f|
# @directory.compact.each do |person|
#   f.write(person.to_yaml)
# end
#}
