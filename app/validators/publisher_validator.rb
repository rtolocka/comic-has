require "net/http"

class PublisherValidator < ActiveModel::Validator
    def validate(record)
        if 
            response = Net::HTTP.get_response("http://www.comicvine.com","/api/search/?api_key=b58fce77d95f376a7766f29827a3adb71f657807&format=json&resources=publisher&query=#{record.name}")
            puts response.body #this must show the JSON contents
        end
    end
 end