require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @blank_word_error = ""
  @list = Word.all
  erb(:words)
end

post('/') do
  word = params["word"]
  @blank_word_error = ""
  if (word == "")
    @blank_word_error = "Please enter a word."
  else
    Word.new({:word=> word, :word_definition=> []}).save
  end
  @list = Word.all
  erb(:words)
end

post('/clear') do
  Word.clear
  @blank_word_error = ""
  @list = Word.all
  erb(:words)
end

get('/words/:id') do
  @word = Word.find(params[:id])
  erb(:word)
end

post('/words/:id') do
  @word = Word.find(params[:id])
  @word.word_definition.push(params['definition'])
  erb(:word)
end
