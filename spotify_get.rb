require 'httparty'

puts " coucou2"
def get_latest_release
     response = HTTParty.get('https://api.spotify.com/v1/browse/new-releases?limit=2',
                      headers:{"content-type": 'application/json',
                               "Accept": 'application/json',
                               "Authorization": "Bearer BQBO-xWS975qb_1jym1_nXxDv8JoER3qZJVNQPQGe-EYYOzYLDyx1gaXRlc2w9fyimm1lTcJnEYX0vXot68"})

     puts response.body, response.code, response.message, response.headers.inspect

     puts " coucou3"
end

puts get_latest_release
puts " coucou4"
