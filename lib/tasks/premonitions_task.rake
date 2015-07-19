namespace :premonitions_task do
  desc "TODO"

  task send_tweet: :environment do
  		 require 'rubygems'
		 require 'mongo'
		 require 'twitter' 
		 require 'yaml'
		 require 'multi_json' 		 
		 require 'date' 
		 require 'shorturl'
		 require 'time'
		 require 'bson'
		 require 'action_view'

		 include ActionView::Helpers::SanitizeHelper

		 include Mongo

		stream = Twitter::REST::Client.new do |config|  
		  config.consumer_key       = "I5R0clurlZE3Oag8j94eZbx9q"
		  config.consumer_secret    = "QRq610Qaiakj1YMspwJa3PvRaWtHRJN2jjkAQj5PzQO73P4Y3Y"
		  config.access_token        = "2692189418-LWRxyUaytKq9uA4LIDMYgljAzb7ac7M4p3CruNo"
		  config.access_token_secret = "lafHCrT00YjnSH9vAHwJkh5u3rnuXiA7hfEGmZBZhDa5b"
		end

		#db = MongoClient.new("linus.mongohq.com", 10077).db("sightings")
		#db = MongoClient.from_uri("mongodb://ufo:ufo@linus.mongohq.com:10077/sightings")
		#tweets = db.collection("ufo")


		#client = Mongoid.load!(Rails.root.join("/config/mongoid.yml", :development)) #Mongo::MongoClient.from_uri("mongodb://unveiledfuture:joseypaco@oceanic.mongohq.com:10057/app25219600")
		#client = Mongoid.load!("config/mongoid.yml")     


		db = Mongo::Client.new([ '127.3.65.130:27017' ], :database => 'pmn2015', :user => ENV['OPENSHIFT_MONGODB_DB_USERNAME'], :password => ENV['OPENSHIFT_MONGODB_DB_PASSWORD'])


		#db = client.db("premonitions")
		tweets = db["premonitions"]
				
		
		one_premonition = tweets.find().to_a

		num = one_premonition.count
		
		random = rand(1..num)

		contador = 1

		one_premonition.each do |report_premonition|
		  	            
		        if random==contador

			    	title = strip_tags("\"")     

			    	#print report_premonition["description"][0..70]

			    	description = report_premonition["description"][0..70].gsub(".","")
			    	
			  	    title +=  strip_tags(description)
			        title += "...\" #premonitions"
			        #print title

					title_url = "http://www.unveiledfuture.com/premonitions/" 
					title_url += report_premonition["_id"].to_s
					title_url += "/"

					titlepremnt = report_premonition["title"]	
					titlepremnt.gsub!(".","") 
					titlepremnt.gsub!("'","")
			        titlepremnt.gsub!("/","-")
			        titlepremnt.gsub!("&", "-")
			        titlepremnt.gsub!("?","-")
			        titlepremnt.gsub!("[","'")
			        titlepremnt.gsub!("]","'")
			        titlepremnt.gsub!(".","")

			        title_url += titlepremnt
			        
			        print title_url
		        	stream.update(title + " " + ShortURL.shorten(title_url))
		        end
		        contador+=1
		end
  end

end
