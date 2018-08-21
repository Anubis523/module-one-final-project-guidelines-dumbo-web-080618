def review(user)
  # binding.pry
  answer = my_options
  case answer
  when 1
    topic_review(user)
  when 2
    random_review(user)
  when 3
    return
  else
    "Invalid Entry"
    answer = my_options
  end
end


def topic_review(user)
  topics = user.questions.map{|question| question.topic}
  my_topic = nil
  until topics.include?(my_topic) do
    puts "Topics to be reviewed are..."
    topics.each{|topic|
    puts "#{topic}"}
    my_topic = gets.chomp
  end
  on_topic_questions = user.questions.select{|question| question.topic == my_topic}
  # on_topic_questions.map{|e| e.question.question}
  random = on_topic_questions.sample
  rand_quest = random.question
  rand_answer = random.answer
  puts "The Question is: #{rand_quest}?"
  answer = gets.chomp
  check_answer(user, rand_answer, answer)
end

def random_review(user)
  puts "Random question is..."
  random =  user.questions.sample
  rand_question = random.question
  rand_answer = random.answer
  puts rand_question
  answer = gets.chomp
  check_answer(user, rand_answer, answer)
  binding.pry
end

def my_options
  puts "Would you like to do"
  puts "(1) Review by Topic or"
  puts "(2) Review at Random"
  puts "(3) Exit"
  answer = gets.chomp.to_i
end

def check_answer(user, correct_answer, answer)
  if correct_answer == answer
    puts "You are correct, #{user.name}"
  else
    puts "You are wrong!"
  end
end