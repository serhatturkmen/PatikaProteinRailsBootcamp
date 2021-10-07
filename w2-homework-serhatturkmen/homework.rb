require 'json'

grades_json = File.read('./grades.json')
students = JSON.parse(grades_json)
average_grade = students.sum { |item| item['grade'] } / students.count
passed_arr = students.select { |student| student['grade'] >= average_grade }
failed_arr = students.select { |student| student['grade'] < average_grade }

def arr_write(arr, status)
  return_text = ''
  arr.each do |item|
    return_text += if arr.last == item
                     " and #{item['name']}"
                   elsif arr[arr.count - 2] == item
                     (item['name']).to_s
                   else
                     "#{item['name']}, "
                   end
    puts "--------------------"
    puts "#{arr.slice(0, arr.count - 2).each { |item| item["name"]  + "," }} #{arr.slice(arr.count - 2)['name']} and #{arr.last['name']}"
    puts "--------------------"
  end
  return_text += status == 'passed' ? ' are passed' : ' are failed'
end

puts "Average grade is #{average_grade}"
puts arr_write(failed_arr, 'failed')
puts arr_write(passed_arr, 'passed')
