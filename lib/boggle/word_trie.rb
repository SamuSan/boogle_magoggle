require 'rambling/trie'

module Boggle
  class WordTrie
    def initialize(file_path)
      @trie = Rambling::Trie.create file_path
    end

    def word?(word)
      @trie.word? word
    end

    def match?(word)
      @trie.partial_match?
    end
  end
end