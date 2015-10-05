contacts = [
    {
        name: "John Doe",
        phone: "0555 55 55 55"
    },
    {
        name: "Jack Daniels",
        phone: "0772 22 22 22"
    }
]

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
  command = gets.chomp

  case command
    when "list"
      contacts.each do |contact|
        puts "Name: #{contact[:name]}"
        puts "Phone: #{contact[:phone]}"
        puts "---------------------"
      end
    when "find"
      puts "Who do you want to find?"
      search_name = gets.chomp

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

  puts "~~~~~~~~~~~~~~~~~~~~"
end