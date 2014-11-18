require 'sinatra'

ADJECTIVES = %w{stinky smelly ugly alcoholic}
NOUNS = %w{jerk doofus dingus developer}

get '/' do
  insult = [ADJECTIVES.shuffle.first,
      NOUNS.shuffle.first].join ' '

  <<-EOF
  you're a #{insult}
  EOF
end
