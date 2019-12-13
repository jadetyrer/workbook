$allergy_hash = { 
  "eggs" => 1,
  "peanuts" => 2,
  "shellfish" => 4,
  "strawberries" => 8,
  "tomatoes" => 16,
  "chocolate" => 32,
  "pollen" => 64,
  "cats" => 128
}

class Person
  attr_accessor :allergy_score
  def initialize
    @allergy_array = []
  end 

  def allergy_list(allergy_score)
    @allergy_array = []
    $allergy_hash.each do |key, value|
      if allergy_score & value != 0
      @allergy_array.push(key)
      end 
    end 
  @allergy_array
  end 

  def has_allergy(allergen)
    @allergy_array.include?(allergen)
  end 
end 

require "tty-prompt"
person = Person.new
prompt = TTY::Prompt.new

puts "what is your allergy score?"
allergy_score = gets.chomp.to_i
list = person.allergy_list(allergy_score)

response = prompt.select('Would you like to check an item or view entire list?', %w[Check-item Entire-list])
if response == "Entire-list"
  puts "You are allergic to:"
  puts list

else 
  puts "Which allergen would you like to check?"
  allergen = gets.chomp
  if person.has_allergy(allergen)
    puts "You are allergic to #{allergen}."
  else
    puts "You are not allergic to #{allergen}"
  end
end  


# def prime_num(num)
#   (2...num).none? {|div| num % div == 0}
# end 

# prime_array = []
# (1..100).each do |num| 
#   if prime_num(num) == true 
#     prime_array.push(num)
#   end 
# end 

# puts prime_array


# arr = [5, 22, 29, 39, 19, 51, 78, 96, 84]
# i = 0
# while (i < arr.size - 1 and arr[i] < arr[i + 1])
#   i = i + 1 
# end
# arr[i], arr[i + 1] = arr[i + 1], arr[i]

# puts arr





















