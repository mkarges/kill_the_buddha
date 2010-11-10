require 'generate'

gen = Generate.new

builder = Rack::Builder.new do
	use Rack::ShowExceptions
	use Rack::Static, :urls => [ "/stylesheets", "/images", "/js" ] 
	use Rack::Reloader

	map '/' do	
		run gen
	end
	
	map '/*' do
	  run gen
  end  

end

run builder 


