require 'fetch'
require 'nokogiri'
require 'open-uri'

class Generate  
  def call(env)
	    request = Rack::Request.new(env)
    if request.post?
        val = Fetch.new
        final = val.get_words
        while final == nil ; final = val.get_words ; end
        final = final.to_s + "."
        final = final.gsub(/<\/?[^>]*>/, "")  
        final = final.squeeze(" ")    
    else
        final = ""
    end
    header = 
        "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
        <html xmlns=\"http://www.w3.org/1999/xhtml\">
        <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
        <title>Black Box</title>
        <link rel=\"stylesheet\" type=\"text/css\" href=\"/stylesheets/wild.css\" />
   		<script type=\"text/javaScript\" src=\"/js/jquery.js\"></script>
   		<script type=\"text/javaScript\" src=\"/js/javascript.js\"></script>
        </head>"
    body = 
      "<body>
        <div id=\"container\">
          	<p>Click on the Black Box</p> 
       		  <span class=\"box\">
  		    	<form name=\"process\" action=\"\" method=\"post\">
      			<span class=\"click\"><button id=\"process\"><img src=\"images/blackbox.jpg\"</button></span>
      			</form>
      			</span>   
  		    	<div class=\"loading\">SEARCHING...</div>
      			<div class=\"event\"></div>
      			<div class=\"response\">#{final}</p></div>           
          </div>
          <div class=\"header\">
            <div class=\"header_bar\"><a href=\"what\">What?</a></div>
            <div class=\"header_bar\"><a href=\"how\">How?</a></div>
            <div class=\"header_bar\"><a href=\"why\">Why?</a></div>
          
          </div>
       </body>
      </html>"


    [ 200, {"Content-Type" => "text/html"}, [header + body] ]
  end
  
end
    