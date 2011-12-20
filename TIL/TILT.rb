Covers OOP/Arrays/Hash/Struct
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
	
	EXCEPTIONS
	raise - raises an exception , is not a keyword ( Kernel method )
	raise ArgumentError
	raise Some "error text"
	raise ArgumentError , "Bada Data" , caller[0] //tracebak info filename:line:in method

	rescue ArgumentError
	rescue => err //the error is stored in err 

	ensure 
		#this code is allways exectued 

	ARRAYS
		[] , []= special class methods 
		x = Array.new 
		x = Array.new(3) # nil nil nil 
		x = Array.new(3,"blah") # "blah" , "blah" , "blah" /// blah is the same object 
		x = Array.[](1,2,3,4,5) 
		b = Array[1,2,3,4,5]
	#negative index counts backwards x[-1]
	x.length x.size #returns numbers of elements 
	x.nitems #returns number of elements without counting nil 

	x.last x.first #returns last and first element

	x.values_at(2,3,4) #returns an array with the values from the specified indexes
	SORT
	x.sort
	x.sort {|a,b| b <=> a} #reverse sort
	x.sort_by { |x| File.size(x) }
	x.detect { |x| x % 6 == 0} #find the first multiple of 6

	x.find {|e| e % 2 == 0}

	x.select{ |e| e %2 == 0 }
	x.find_all { |e| e %2 == 0 }

	a.grep(/ary/) #January , February
	a.grep(/ary/) {|m| m.length } # 7,8
	a.grep(12..24) #23 , 13 , 15 ...
	#the reject method is complementary to select
	#the inplace mutator reject! modifies the array 
	c = [1,2,3,4,5]
	c.reject! { |e| e % 2 == 0 }
	# c==[1,3,5]
	DataSets 
		a.uniq or a.uniq! #removes duplicates 
		Operations 
		a | b #union
		a & b #intersectie
		a + b # does not remove duplicates
		a - b # A - (A inter B)
	map or collect AND the in-place variant map! , collect!
	x = %w[alpha omega foxtrot]
	a = x.collect { |w| w[0..0] } # %w[a,o,f] 
	b = x.collect { |w| w.length } #

	compact method replaces the nil values from the array 
	a = [1,nil,2,3,nil,4,5,nil,nil]
	a.compact # 1 2 3 4 5 


	a.delete_at(2)
	a.delte("spam")

	a.clear

	Iterating over an Array
	each
	reverse_each
	each_index
	each_with_index
	random_each


	HASH
	Create a new Hash 
	a1 = Hash.[]("unu",1,"doi",2)
	a2 = Hash.[]("unu"=>1,"doi"=>2)
	b1 = Hash["flat",2,"curved",1]
	b2 = Hash["flat"=>1,"curved"=>2]

	Hash.new #creates an empty hash 
	Hash.new(x) #creates an empty hash and returns x as a default value but hash is still empty 
	x.deafult = "nothing"
	x.inspect #{}

	fetch - raises IndexError exception if the key doesnt exist in the Hash Object
				- takes a second parameter that serves as default value 
				- optionaly accepts a block to produce a default value if the key is not found
	
	a = {}
	a["flat"]= 3
	#{"flat"=>3}
	a.[] = ("curved",2)
	#{"flat" => 3 , "curved" => 2 }
	a.store("angled",5)
	#{"flat" => 3 , "curved" => 2 ,"angled" => 5 }
	Deleting key-values pairs
		clear , delete , shift
		delete_if , reject , reject! - used in conjection with the required block if true deletes the item
	Iterating over 
		each , each_key , each_pair , each_value 
	Detecting keys and values 
		has_key? (or any of its aliases include? key? or member?)
		a.has_key? "c"
		has_value? or value?
	Convert hashes to array with to_a
		keys will be on the even indexes and values on the odd
		a.to_a # ["key",value,"key",value]
		a.keys # returns and array with all the keys 
		a.values #similar to keys

		a.values_at(1,"2",:sin)

		Selecting , finding key value paris is similar to Arrays 
		Sorting , sort - returns an array
		Merging Hashes 
			hash1.merge(hash2)
			passing a block to deal with collision
			hash1.merge(hash2) { |key,old,new| old<new ? old : new }
		Creating a hash from an array 
		the array must have an even number of elements 
		hash_from_array = Hash[*array]
		Inject Examples
			a.inject(0) { |a,b| a+b }
			or
			a.inject() { |a,b| a+b }
			
			a.inject(1) { |a,b| a*b }
			or 
			a.inject() { |a,b| a*b }

			a = %w(ana are mere si pere)
			a.inject do |w,best|
				w > best ? w : best 
			end
		Quantifiers 
			any? all? - take a block that returns true/false
			flag1 = nums.any? { |x| x%2 == 0  }
		Partition 
			takes a block that returns true/false and partitions the array into 2 arrays [true] [false]
			a = [1,2,3,4,5,6,8,9]
			a.partition { |x| x < 5 }
			# [1,2,3,4 ] [5,6,8,9]

		Iterating by groups 
			each_slice takes a param n and iterates over that many elements at a time
			#requires enumerator 
