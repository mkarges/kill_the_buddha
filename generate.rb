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
        #add final period unless punctuation already exists at end of string
        if final.slice(-1,1) =~ /\.|\?|\!/
          final = final.to_s
        else
          final = final.to_s + "."
        end
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
        <title>Kill The Buddha!</title>
        <link rel=\"stylesheet\" type=\"text/css\" href=\"/stylesheets/wild.css\" />
   		<script type=\"text/javaScript\" src=\"/js/jquery.js\"></script>
   		<script type=\"text/javaScript\" src=\"/js/javascript.js\"></script>
        </head>"
    body = 
      "<body>
        <div class=\"overlay\">
          <div id=\"container\">
            	<p><img src=\"images/kill.jpg\"</p> 
         		  <span class=\"box\">
    		    	<form name=\"process\" action=\"\" method=\"post\">
        			<span class=\"click\"><button id=\"process\"><img src=\"images/buddha.jpg\"</button></span>
        			</form>
        			</span>   
    		    	<div class=\"loading\">SEARCHING...</div>
        			<div class=\"event\"></div>
        			<div class=\"response\">#{final}</p></div>           
          </div>
            <div class=\"header\">
              <div class=\"header_bar\"><a class=\"whatClick\">What?</a></div>

              <div class=\"header_bar\"><a class=\"howClick\">How?</a></div>

              <div class=\"header_bar\"><a class=\"whyClick\">Why?</a></div>
            </div>
            <div class=\"what\"> 
              <p><i>Kill the Buddha!</i> is a unique web experience. You can't post or share anything here, and nothing has been curated for you. This site doesn't store anything, doesn't connect you to anything, but responds to your requests in a surprising (and delightful) way.
              </p>
            </div>
            <div class=\"how\">
              <p> Clicking on the Golden Buddha will execute a google search using 3 random words (pulled from <a href=\"http://cutup.heroku.com/thedocument\">here</a>). After processing for a few moments, a response will be displayed below. The responses range from the banal to the sublime.
              </p>
            </div>
            <div class=\"why\">
              <p>Wrong question!
              </p>
            </div>
          </div>
       </body>
      </html>"


    [ 200, {"Content-Type" => "text/html"}, [header + body] ]
  end
  
end
    