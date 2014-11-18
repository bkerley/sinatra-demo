require 'sinatra'

ADJECTIVES = %w{stinky smelly ugly alcoholic}
NOUNS = %w{jerk doofus dingus developer}

get '/' do
  <<-EOF
    <h1>Welcome to Miami Ruby Brigade</h1>
    <p><a href="/insult">get insulted here, it's free!</a></p>
    EOF
end

get '/insult' do
  insult = [ADJECTIVES.shuffle.first,
      NOUNS.shuffle.first].join ' '

  <<-EOF
  you're a #{insult}
  EOF
end

get '/insult/:noun' do
  insult = ADJECTIVES.shuffle.first

  <<-EOF
  you're #{insult}, #{params[:noun]}
  EOF
end
