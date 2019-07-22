require 'boggle/word_trie'

RSpec.describe Boggle::WordTrie do
  subject { described_class.new(file_path) }
  let(:file_path) { "#{Dir.pwd}/spec/support/data/test_words.txt" }

  it 'contains the given words' do
    expect(subject.word?('boop')).to be true
  end

  it 'responds false to nonsense words' do
    expect(subject.word?('dingus')).to be false
  end
end