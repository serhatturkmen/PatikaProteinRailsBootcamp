
if ARGV[0].nil?
  exec('bundle exec ruby app.rb')
elsif ARGV[0] == '-s'
  exec("bundle exec ruby app.rb -s '#{ARGV[1]}'")
end
