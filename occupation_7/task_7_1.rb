puts "Rock, paper or scissor"
w = 0 and l =0 and t =0 and j=0
loop{
  choice = ["paper" , "rock" , "scissor" ]
  i=0

  if j ==10
    puts "wins : #{w}\nlosses : #{l}\ndraw:    #{t}"
    if w > l
      puts "You won the game"
    elsif w<l
      puts "You lost!"
    else
      puts "The game is a draw"
    end

    gets
    break
  end
  while i == 0
    human = gets.chomp.downcase
    choice.each {
        |x|
      if human == x
        i+=1 and j+=1
        break
      end
    }
    puts "-----------------please enter rock paper or scissor-----------------" if i == 0
  end
  computer = rand(3)
  com = choice[computer]
  if (com == "scissor" and human != "rock") or (human == "scissor" and computer !=1)
    v = human <=> com
  else
    v = com <=> human
  end



  puts "You chose #{human}, computer choose #{com}"
  case v

    when 1
      puts "---->You win"
      w +=1
    when -1
      puts "---->Computer wins"
      l+=1
    else
      puts "---->draw"
      t+=1
  end
}