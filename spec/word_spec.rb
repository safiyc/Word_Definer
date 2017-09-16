require 'rspec'
require 'word'
require 'pry'

describe("#Word") do
  describe("#word") do
    it("checks for value of 'word' instance of class 'Word'") do
      word1 = Word.new({:word=> "Answer", :word_definition=> "The solution to a problem"})
      expect(word1.word()).to(eq("Answer"))
    end
  end

  describe("#word_definition") do
    it("checks for value of 'word_definition' instance of class 'Word'") do
      word1 = Word.new({:word=> "Answer", :word_definition=> "The solution to a problem"})
      expect(word1.word_definition()).to(eq(["The solution to a problem"]))
    end
  end

  describe("#save") do
    it("saves words and definitions") do
      word1 = Word.new({:word=> "Answer", :word_definition=> "The solution to a problem"})
      word1.save
      word2 = Word.new({:word=> "Tired", :word_definition=> "The result of spending a whole day figuring out coding errors"})
      word2.save
      expect(Word.all()).to(eq([word1, word2]))
    end
  end

  describe(".clear") do
    it("clear saved words and definitions") do
      word1 = Word.new({:word=> "Answer", :word_definition=> "The solution to a problem"})
      word1.save
      word2 = Word.new({:word=> "Tired", :word_definition=> "The result of spending a whole day figuring out coding errors"})
      word2.save
      Word.clear
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("increments the id by 1 of a word that is added") do
      word1 = Word.new({:word=> "Blue", :word_definition=> "A color"})
      word1.save
      word2 = Word.new({:word=> "Answer", :word_definition=> "The solution to a problem"})
      word2.save
      expect(word1.id()).to(eq(1))
      expect(word2.id()).to(eq(2))
    end
  end

  describe(".find") do
    it("finds a word based on its id") do
      Word.clear
      word1 = Word.new({:word=> "Answer", :word_definition=> "The solution to a problem"})
      word1.save
      word2 = Word.new({:word=> "Tired", :word_definition=> "The result of spending a whole day figuring out coding errors"})
      word2.save
      expect(Word.find(2)).to(eq(word2))
    end
  end

  describe("#more_definitions") do
    it("give multiple definitions to word") do
      word1 = Word.new({:word=> "Tired", :word_definition=> "The result of spending a whole day figuring out coding errors"})
      word1.word_definition = ["Lack of energy"]
      expect(word1.word_definition).to(eq(["Lack of energy"]))
    end
  end
end
