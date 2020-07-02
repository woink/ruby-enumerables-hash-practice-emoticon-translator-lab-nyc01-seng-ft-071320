# require modules here
require 'pry'
require 'yaml'

def load_library(emoticons)
  YAML.load_file(emoticons).each_with_object({}) do |(key, emoji), final_result|
   final_result[key] = { english: emoji[0], japanese: emoji[1] }
  end
end

def get_japanese_emoticon(emoticons, emoji)
  # code goes here
  result = "Sorry, that emoticon was not found"
  load_library(emoticons).each do |key, value|
   value.each do |language, library_emoji|
    if emoji == library_emoji
     result = value[:japanese]
    end
   end
  end
  result
end

def get_english_meaning(emoticons, emoji)
  result = "Sorry, that emoticon was not found"
  load_library(emoticons).each do |key, value| 
   if emoji == value[:japanese]
     result = key
   end
  end
  result
end