class Klout < ActiveRecord::Base
	
	@@key = 'qwgbx5cjs97y2368nb3qtpf8'

		def self.get_id(twitter_id)
			http = Curl.get("http://api.klout.com/v2/identity.json/tw/#{twitter_id}?key=#{@@key}")
			response = JSON.parse(http.body_str, symbolize_names: true)
			id =  response[:id]
			
			id
		end

		def self.get_score(klout_id)
			http = Curl.get("http://api.klout.com/v2/user.json/#{klout_id}/score?key=#{@@key}")
			response = JSON.parse(http.body_str, symbolize_names: true)
			score = response[:score]

			score
		end

		def self.get_topics(klout_id)
			http = Curl.get("http://api.klout.com/v2/user.json/#{klout_id}/topics?key=#{@@key}")
			response = JSON.parse(http.body_str, symbolize_names: true)
			topics = Array.new
			response.each do |r|
				topics << r[:name]
			end

			topics
		end

end
