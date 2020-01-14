require 'http'

while true
  print "Give me a word ('q' to quit): "
  user_input = gets.chomp
  if user_input == "q"
    break
  end

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ user_input }/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=48dd829661f515d5abc0d03197a00582e888cc7da2484d5c7")


  definitions = response.parse[0..1]

  puts "Definitions"
  puts

  definitions.each do |definition|
    puts "   • #{definition["partOfSpeech"]} - #{definition["text"]}"
  end

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ user_input }/topExample?useCanonical=false&api_key=48dd829661f515d5abc0d03197a00582e888cc7da2484d5c7")

  example = response.parse
  puts "   • Top example: #{example["text"]}."

  response = HTTP.get("https://api.wordnik.com/v4/word.json/alphabet/pronunciations?useCanonical=false&limit=50&api_key=48dd829661f515d5abc0d03197a00582e888cc7da2484d5c7")

  pronounce = response.parse
  puts "   • Pronounciation: #{pronounce["raw"]}"
  puts "=" * 30

    
end

# require 'http'

# response = HTTP.get("https://api.wordnik.com/v4/word.json/ducks/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=48dd829661f515d5abc0d03197a00582e888cc7da2484d5c7")

# definitions = response.parse

# pp definitions



