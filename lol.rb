puts '<html>'
puts '<head>'
puts '<title>RC Creative coding lol</title>'
puts '</head>'
puts '<body>'
puts '<h1>RC Creative coding list of things</h1>'

Dir.glob("sketches/*.md").sort.reverse.each do |file|
  puts "<h2>#{file}</h2>"
  puts File.read(file)
  puts "<br>"
end

puts '</body>'
puts '</html>'