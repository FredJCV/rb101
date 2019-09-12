def valid?(input)
  input.to_f > 0 && input.to_i.to_s == input || input.to_f.to_s == input
end

loan_amount = ''
apr = ''
year_duration = ''

puts "=> Let's get your monthly payment! What is your total loan amount?"

loop do
  loan_amount = gets.chomp
  if valid?(loan_amount)
    break
  else
    puts "=> Please enter a valid number"
  end
end

puts "=> What is your Annual Percentage Rate (APR)?"

loop do
  apr = gets.chomp
  if valid?(apr)
    break
  else
    puts "=> Please enter a valid number"
  end
end

puts "=> What is your loan duration (in years)?"

loop do
  year_duration = gets.chomp
  if valid?(year_duration)
    break
  else
    puts "=> Please enter a valid number"
  end
end

monthly_interest_rate = apr.to_f * 0.01 / 12
month_duration = year_duration.to_i * 12

monthly_payment = (loan_amount.to_i *
                  (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**(-month_duration))))
                  .round(2)

puts "=> Your monthly payment is $#{monthly_payment}"
