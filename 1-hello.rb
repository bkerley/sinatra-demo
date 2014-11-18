require 'sinatra'
require 'json'

ADJECTIVES = %w{stinky smelly ugly alcoholic}
NOUNS = %w{jerk doofus dingus developer}

get '/' do
  erb :index
end

get '/insult' do
  insult = [ADJECTIVES.shuffle.first,
      NOUNS.shuffle.first].join ' '
  @insult = insult
  haml :insult, locals: {insult: insult}
end

get '/insult/:noun' do
  insult = ADJECTIVES.shuffle.first

  <<-EOF
  you're #{insult}, #{params[:noun]}
  EOF
end

get '/insult.json' do
  insult = {
    noun: (n = NOUNS.shuffle.first),
    adjective: (a = ADJECTIVES.shuffle.first),
    insult: [n, a].join(' ')
  }
  content_type :json
  insult.to_json
end

post '/words' do
  body = request.body.read
  payload = JSON.parse body
  nouns = payload['nouns']
  adjectives = payload['adjectives']

  NOUNS = [NOUNS + nouns].flatten.uniq if nouns
  ADJECTIVES = [ADJECTIVES + adjectives].flatten.uniq if adjectives

  content_type :json
  {
    adjectives: ADJECTIVES,
    nouns: NOUNS,
    payload: payload
  }.to_json
end
