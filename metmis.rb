class Uuu 
	def method_missing(sym)
		define_method(sym) do |*args|
			x = args 
			puts "Merge? #{x}" 
		end 
		self.send sym "Da"
	end
end

