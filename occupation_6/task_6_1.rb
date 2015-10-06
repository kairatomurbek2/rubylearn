contacts = []

file = File.open("contacts.txt")

file.each_line do |line|
  line_data = line.split (",")
  contact = {
      name: line_data[0],
      phone: line_data[1]
  }

  contacts.push contact
end

file.close

def enter_sign()
  print "> "
  return gets.chomp
end

def find_by_name(contacts_array, name)
  contacts_array.each do |contact|
    if contact[:name] == name
      return contact
    end
  end

  return nil
end

loop do
  puts "What do you want to do?"
  command = enter_sign

  case command
    when "list"
      contacts.each do |contact|
        puts "Name: #{contact[:name]}"
        puts "Phone: #{contact[:phone]}"
      end
    when "find"
      puts "Who do you want to find?"
      search_name = enter_sign

      contact = find_by_name(contacts, search_name)

      if contact.nil?
        puts "Contact not found"
      else
        puts "Name: #{contact[:name]}"
        puts "Phone: #{contact[:phone]}"
      end
    when "add"
      hash_with_addings = {}

      puts "Please add the name and the contacts of the person"
      print "Enter name: "
      entered_name = enter_sign

      contact = find_by_name(contacts, entered_name)
      if contact.nil?
        print "Enter phone number: "
        entered_phone = enter_sign

        hash_with_addings[:name] = entered_name
        hash_with_addings[:phone] = entered_phone

        contacts.push hash_with_addings

        puts "Contact is successfully added"
      else
        puts "This contact already exists"
      end
    when "exit"
      puts "Exiting..."
      break
    else
      puts "No such command"
  end

end