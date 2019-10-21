require 'pry'

class PigLatinizer

  def piglatinize(input)
    x = piglatinize_word(input)
    puts x
    x
  end

  def piglatinize_word(word)
    if word.split(" ").count > 1
      sentence = word.split(" ")
      piglatinize_sentence(sentence)
    elsif
      word.start_with?(/([aeoui])/i)
      piglatin_vowel(word)
    else
      piglatin_consonant(word)
    end
  end

  def piglatin_vowel(word)
      @new_word = word << "way"
      @new_word
  end

  def piglatin_consonant(word)
    words = word.split(" ")
    words.each do |w|
      if w.start_with?(/([^aeiou]{3})/i)
        new_word = w.slice(0..2) << "ay"
        pigged_word_3 = w.insert(-1, new_word)
        return pigged_word_3[3..-1]
      elsif w.start_with?(/([^aeiou]{2})/i)
        new_word = w.slice(0..1) << "ay"
        pigged_word_2 = w.insert(-1, new_word)
        return pigged_word_2[2..-1]
      else w.start_with?(/([^aeiou]{1})/i)
        new_word = w.slice(0) << "ay"
        pigged_word_1 = w.insert(-1, new_word)
        return pigged_word_1[1..-1]
      end
    end
  end

  def piglatinize_sentence(sentence)
    @array = []
    sentence.collect do |w|
      @array << piglatinize(w)
    end
    @array.join(" ")
  end
end

