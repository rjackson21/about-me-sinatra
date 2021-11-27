require 'sinatra'
require 'genius'
#require 'sinatra/reloader' if development? # Learn more about the reloader at sinatrarb.com
#require 'sinatra/multi_route'
=begin
get '/example' do
  "This is an example
  <form action='/example' method='post'>
    <input type='submit' value='Click To Post'>
  </form>" 
end

post '/example' do
  "<h1>POSTED</h1>
  <a href='/'>Click to go back home</a>"
end
=end



get '/' do
  Genius.access_token = 'uiIUcF6fqotNWzjONln1077y7jPrnDq46kzwd4ChUZ5_PexdAgSsVGFzoMCOZYi8'
  songs = Genius::Song.search("The Hills")
  erb :home, locals: {songs: songs}
end

get '/home' do
  erb :home
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

# This page gets rendered when the user enters an unidentified route
not_found do
  erb :not_found, :layout => :error_layout
end
