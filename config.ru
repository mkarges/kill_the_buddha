require 'generate'

gen = Generate.new

builder = Rack::Builder.new do
	#middleware	
	use Rack::ShowExceptions
	use Rack::Reloader
	use Rack::Static, :urls => [ "/stylesheets", "/images", "/js" ] 

	#url mapping / need to amend Generate class to only process Fetch when instructed (through another class, e.g. Process)
	map '/' do	
		run gen
	end
	
	map '/*' do
	  run gen
  end  

end

# rack this up
run builder 


