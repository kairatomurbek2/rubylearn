def read_contacts()
  contacts = []
  file = File.open("contacts.txt")
  file.each_line do |line|
    line_data = line.split (",")
    contact = {
        :name => line_data[0],
        :phone => line_data[1]
    }
    contacts.push contact
  end

  file.close
  contacts
end

def write_contacts_to_the_end(contacts)
  new_contacts_file = File.new("contacts.txt", "a")
  new_contacts_file.write contacts.join (",")
  new_contacts_file.write "\n"
  new_contacts_file.close
end

def rewrite_contacts(contacts)
  new_contacts_file = File.new("contacts.txt", "w")
  contacts.each do |contents|
    new_contacts_file.write ("#{contents[:name]},#{contents[:phone]}")
  end

  new_contacts_file.close
end

def find_by_name(contacts_array, name)
  contacts_array.each do |contact|
    if contact[:name] == name
      return contact
    end
  end

  return nil
end

def help()
  all_commands = [
      "1. List - show all of the contacts",
      "2. Find - allows to find the contact you want",
      "3. Add 1 - allows to rewrite the phonebook at all",
      "4. Add 2 - allows to add one contact to the phonebook",
      "5. Remove - allows to delete one of the contacts",
      "6. Edit - allows to change phone number of one contact",
      "7. Help - shows all commands you may use"
  ]

  return all_commands
end

def check_for_commas(entering)
  if entering.include? ","
    puts "You can not use commas. Please try again!"
    exit
  end
end

def check_for_arguments(entering)
  if entering.nil?
    puts "Please, enter one more argument."
    exit
  end

  return entering.capitalize
end

contacts = read_contacts()

command = ARGV[0]

case command
  when "list"
    contacts.sort! do |first, second|
      first[:name] <=> second[:name]
    end
    contacts.each do |contact|
      contact.each do |name, phone|
        print sprintf("%-7s %1s", name, phone) + "\n"
      end
    end

  when "find"
    entering = ARGV[1]
    search_name = check_for_arguments (entering)
    check_for_commas(search_name)
    contact = find_by_name(contacts, search_name)
    if contact.nil?
      puts "Contact not found"
    else
      contact.each do |name, phone|
        print sprintf("%-7s %1s", name, phone) + "\n"
      end
    end

  when "add"
    choose_command = ARGV[1]
    check_for_arguments (choose_command)

    case choose_command
      when "1"
        new_contacts_hash = {}
        entering = ARGV[2]
        entered_name = check_for_arguments (entering)
        check_for_commas(entered_name)
        contact = find_by_name(contacts, entered_name)
        if contact.nil?
          entering = ARGV[3]
          entered_phone = check_for_arguments (entering)
          check_for_commas(entered_phone)
          contacts = []
          new_contacts_hash[:name] = entered_name
          new_contacts_hash[:phone] = entered_phone
          contacts.push (new_contacts_hash)
          rewrite_contacts(contacts)
          puts "Contact is successfully added"
        else
          puts "The contact is already exist"
        end

      when "2"
        new_contacts_array = []
        entering = ARGV[2]
        entered_name = check_for_arguments (entering)
        check_for_commas(entered_name)
        contact = find_by_name(contacts, entered_name)
        if contact.nil?
          entering = ARGV[3]
          entered_phone = check_for_arguments (entering)
          check_for_commas(entered_phone)
          new_contacts_array[0] = entered_name
          new_contacts_array[1] = entered_phone
          write_contacts_to_the_end(new_contacts_array)
          puts "Contact is successfully added"
        else
          puts "The contact is already exist"
        end
    end

  when "remove"
    entering = ARGV[1]
    entered_name = check_for_arguments (entering)
    check_for_commas(entered_name)
    contact_for_remove = find_by_name(contacts, entered_name)
    if contact_for_remove.nil?
      puts "No such contact in phonebook"
    else
      contacts.delete (contact_for_remove)
      puts "Contact was successfully removed from phonebook"
      rewrite_contacts(contacts)
    end

  when "edit"
    entering = ARGV[1]
    entered_name = check_for_arguments (entering)
    check_for_commas(entered_name)
    name_for_edit = find_by_name(contacts, entered_name)
    if name_for_edit.nil?
      puts "There is no such contact in the phonebook"
    else
      new_phone_number = ARGV[2]
      check_for_arguments (new_phone_number)
      new_phone_number += "\n"
      name_for_edit[:phone] = new_phone_number
      rewrite_contacts(contacts)
    end
    puts "The contact was successfully edited"

  when "help"
    puts "You can use one of the program below:"
    puts "______________________________________________"
    puts help()
  else
    puts "Please, enter one of the commands below:"
    puts "______________________________________________"
    puts help()

end