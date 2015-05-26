# access twitter from R
myapp  <- oauth_app("twitter", key="youConsumerKeyHere", secret="yourConsumerSecretHere")
sig    <- sign_oauth1.0(myapp, token="yourTokenHere", token_secret="yourTokenSecretHere")
homeTL <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# Convert the json object
json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

# In general look at the documentation, in particular to commands:
# GET, POST, PUT, DELETE
# Most modern APIs use something like oauth
# httr works well with Facebook, Google, Twitter, Github, etc.