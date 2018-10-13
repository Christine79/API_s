require "httparty"
require 'dotenv'
require 'pry'


# Appelle la gem dotenv


# Ceci appelle le fichier .env grâce à la gem dotenv, et enregistre toutes les données enregistrées dans une hash ENV

Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs

#client = Spotify::REST::Client.new do |config|
# config.consumer_key        = ENV["config.consumer_key"]
# config.consumer_secret     = ENV["config.consumer_secret"]
# config.access_token        = ENV["config.access_token"]
# config.access_token_secret = ENV["config.access_token_secret"]
#end


def encode (a, b)
# je transforme mes clés de cette manière


    client_id_secret =  "#{a}:#{b}"
#    puts " client_id " + client_id

# j'encode en base 64 (regarde la doc, Ruby a plusieurs méthodes pour ça)

    require "base64"

    enc = Base64.strict_encode64(client_id_secret)

    # Je rajoute "Basic " devant mon string encodé (n'oublie pas l'espace)


    enc = "basic #{enc}"
#    binding.pry
    puts "dasn encode"
    puts "AVANT--->" + enc + "<---"

    lgn = enc.length
    puts lgn
    lgn = (lgn-2)
    puts lgn
   enc = enc[0..lgn]
    puts "APRES--->" + enc + "<---"

    return enc

  end

#puts encode(ENV["client_id"], ENV["client_secret"])
puts " coucou1"


def req (c)

  ma_requete_post = HTTParty.post("https://accounts.spotify.com/api/token",
                              headers:{'Authorization':"#{c}"},
                              body:{grant_type: 'client_credentials'})

#.post('/updates/create.json', :body => {"text" => text, "profile_ids[]" => @id, "access_token" => @token})


puts "dasn req"
    return ma_requete_post

end

puts "coucou1b"


puts req(encode(ENV["client_id"], ENV["client_secret"]))


puts " coucou2"
#response = HTTParty.get('https://accounts.spotify.com/api/token')
puts " coucou3"

puts response.body, response.code, response.message, response.headers.inspect
puts " coucou4"
#Authorization: Bearer <access_token>
#def get_req
#ma_req_get = HTTParty.get("https://api.spotify.com/v1/browse/new-releases")
#end
