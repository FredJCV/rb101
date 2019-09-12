require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')
LANGUAGE = 'es'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def operation_to_message(op)
  word =  case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end
  word
end

prompt('welcome')

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

Kernel.puts("=> Hi #{name}!")

loop do
  number1 = ''
  number2 = ''

  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt('valid_number')
    end
  end

  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt('valid_number')
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  puts operator_prompt

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_selection')
    end
  end

  Kernel.puts("=> #{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end

  Kernel.puts("=> The result is #{result}")

  prompt('again')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('bye')
