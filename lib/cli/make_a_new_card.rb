def make_a_new_card(user)
  puts "Welcome #{user}. What would you like to do?"
  puts "(1) Add a new card"
  puts "(2) Go back to Main Menu"

  choice = gets.chomp

  while choice != "2"
    puts "Make a new card. Please provide a topic"
    topic = gets.chomp
    puts "Topic is #{topic}. What is the Question you would like it add?"
    question = gets.chomp
    puts "What is the answer to your question?"
    answer = gets.chomp

    user.find_or_create_question(topic, question, answer)


    puts "The question card has been added to your deck with topic #{topic}."
    puts "Would you like to (1) add another question or (2) go back to main menu?"
    choice = gets.chomp
  end
end