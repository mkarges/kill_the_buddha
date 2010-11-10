class Fetch
  def get_words
    d = ""
    a = []
    d = Nokogiri::HTML(open("http://cutup.heroku.com/thedocument"))
    document = d.css('div#container').each do |c|
      a << c
      a = a.to_s
    end
    a = a.gsub(/<\/?[^>]*>/, "")

    new = a.split(/ /)
    num = new.size
      one = rand(num)
      two = rand(num)
      three = rand(num)
      words = new[one]
        words << " "
      words << new[two]
        words << " "
      words << new[three]
      puts words
      words = URI.escape(words)
      
      doc = Nokogiri::HTML(open("http://www.google.com/search?q=#{words}"))

      new = []
      #sorts thru google search results and creates array with each
      doc.css('h3.r a.l').each do |link|
        new << link
      end

      #this loops through search results, finds urls for each, and returns first one that contains ".html" 
      result = []
      new.each do |p|
        if p.values[0] =~ /\.html/
          result << p.values[0]
          break p
        end
      end

      #if result is nil, run code again
      if result.empty?
        puts "result is empty"
        return nil
      else
          #this gives us a valid url to pass into nokogiri 
          r = result.to_s 

          #print url (for testing)
          puts r 
      
          doc2 = Nokogiri::HTML(open(r))

          new2 = []
          doc2.css('p').each do |text|
            text = text.to_s.gsub(/<\/?[^>]*>/, "") #this assures that html markup is removed from result
            new2 << text
          end

          #OK - so this will find the <p> element with the most num of characters and store it in array "arr"
          char = 0
          arr = []
          new2.each do |c|
             d = c.to_s.count c
              if d > char
                char = d
                arr.clear
                arr << c
              end
          end
      
          #not long enough to return a useful response - 21 is an arbitrary length I chose
          if arr.inspect.length <  21
            puts "less than 21"
            return nil
          else      
              #This splits the arr into "sentence" elements and holds on to longest one, storing it in "final"
              arr = arr.to_s.split(".")
              p = 0
              final = []
              arr.each do |c|
                longest = c.to_s.count c
                  if longest > p
                    p = longest
                    final.clear
                    final << c
                  end
              end
              final
          end
      end  
  end
end