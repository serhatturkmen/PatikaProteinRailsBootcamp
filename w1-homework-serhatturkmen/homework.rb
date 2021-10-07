require 'time'

now_time = Time.new
result_text =
  case now_time.hour
  when 0..6 then 'Zzzzz'
  when 6..12 then 'Good Morning'
  when 12..17 then 'Good Evening'
  else 'Good Night'
  end

puts "Your current time is #{now_time.strftime('%H:%M')} #{result_text}"
