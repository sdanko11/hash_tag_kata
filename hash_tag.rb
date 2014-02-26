require 'pry'

def get_hashtags(post)
  @hashtag_words = [] if @hashtag_words.nil?
  post.split(" ").each do |word|
    word = word.split('')
    if word[0] == "#"
      if word[1] == "#"
        word = word.join
        word.slice!(0)
        get_hashtags(word)
      elsif word[1] =~ /[a-zA-Z]/ && word.count("#") == 1
        word = word.join("")
        word.slice!(0)
        @hashtag_words << word
      end
    end
  end
  @hashtag_words
end

