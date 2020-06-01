
class Cli
    attr_accessor
        
        def start
        puts "Welcome, please enter an anime name to search for more info or type exit to end this session."
        self.menu
        end

        def menu
            input = gets.strip.downcase
            if input == "exit"
               puts "Thank you for using our service."
            else 
                anime_pull(input)
        end
    end


        def anime_pull(input)
        Api.new.edit_data(input)
        Media.all.each {|result| puts result.title}
        puts "Pick one you would like to know more about or type exit."
        input = gets.strip.downcase
        if input == "exit"
            puts "Thank you for using our service"
        else
        title_out(input)
        end
    end

        def title_out(input)
        out = Media.all.detect{|result| result.title.downcase == input}
        puts "Mal ID Number: #{out.mal_id}\n"
        puts "Title: #{out.title}\n"
        puts "Rated: #{out.rated}\n"
        puts "Synopsis: #{out.synopsis}\n"
        puts "URL: #{out.url}\n"
        puts "Score: #{out.score}.score\n\n\n"
        puts "Thank you! Please search again!"
        end
     
     
        def   self.no_results
        puts "No results found please type the name again:"
        menu
        end

        def closer
        puts "Thank you for using our service!"
        end
end

