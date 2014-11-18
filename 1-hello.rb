require 'sinatra'

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
