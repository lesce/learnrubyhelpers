Local variables - start with a lower letter or undescore and contain num or letters and underscore
Instances - start with @ and sort the pourpose of storing information for individual objects 
Class variables  - start with @@  , store information per class hierarchy 
Global variables - start with $ 

require rbconfig 
Config::CONFIG["term"] // -term Ex archdir binddir

load vs require 

load - needs the file extension , require doesn't
require - doesn't reload files that have already been loaded 
include - adds a module 
 
Rake task management 

//Ex rake namespace:task
rake admin:clean_tmp //looks in the rake file for the clean_tmp task in the admin namespace

Objects 

every object has this methods derived from BasicObject
	object_id 	//return object id 
	respond_to? // return true/fals if object can respond to the specified message
	send 				// sends a message to the object similar to obj.message
	Note: better use public_send or private_send or __send__ instead of send 

Method arguments 
- Required | def method(a,b,c) | method(1,2,3) 
- Optional | def method(a,c*) && def method(c*) | method(1,2,3,4,5) || method(1) && method() || 
					method(1,2,3,3,5)
- Default-valued | def method(a=1) | method() --> a == 1 || method(2) --> a == 2 

Immediate Values 
	Integers , Symbols , true/false/nil are stored as immediate values 
Reference 
	when u assign a string to a variable u don't assign the actual value of the string but the 
	reference to it's object ( sort of like a pointer ) 
	Note:cu can change the actual string with .replace(STRING)
Ways to duplicate a string str.dup and str.clone
Freeze a string -- with str.freeze | prevents the string to undergo any changes 

singleton - methods : methods that u define for one particular object
Example 
 	c = Clasa.new
	def c.show
		puts c
	end
re-opening classes - ruby merges all the class definitions of a given class
class nume
	def show
	end
end
class nume 
	def put
	end
end

syntactic sugar for assignment like method 
	u can define setter method like method=(params)
	attr_reader :value :date :etc
	attr_writer :value :date :etc
	or create both a seter and a getter with 
	attr_accessor :value  // equivalent to attr_reader AND attr_writer 
  or simply attr :value , true // without true it will only create the getter 

Class methods -- def Classname.method //can't be accessible from the object instance  

Super (lookup method)
  *called with no arguments list it forwards the arguments that were sent 
	to the method that executed super "super"
  *called with an empyt list arguments it dosn't forward anything "super()"
  *called with specific arguments it forwards exactly those "super(a,b,c)"

	Dup and Clone
	Dup copies only the objects content
	Clone copies the content and other associated singleton classes associated with the object
	
	initialize_copy() -- override for custom cloning

	EX: 
	def initialize_copy()
		@time = Time.now
	end

	allocate -- EX : x = Person.new(blabla)  	#blabla 
									 b =  Person.allocate 		#nil
	
	Structs 
	EX: 

	Address = Struct.new("Address",:oras,:strada)
	x = Address.new("Bucuresti","Nicolae Iorga")
	
	OR
	
	Struct.new("Address",:oras,:strada)
	x = Struct::Address("Bucuresti","Nicolae Iorga")

	EXTENDS
		extend model_name
		Adds the model methods into the class as singleton class methods 

	


