puts '<html>'
puts '<head>'
puts '<meta charset="utf-8"/>'
puts '<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>'
puts '<title>RC Creative coding lol</title>'
puts '</head>'
puts '<body id="content">'
puts '<h1>RC Creative coding list of things</h1>'

Dir.glob("sketches/*.md").sort.reverse.each do |file|
  puts "<h2>#{file}</h2>"
  puts File.read(file)
  puts "<br>"
end

puts <<-EOF
<script>
  marked.setOptions({ gfm: true, breaks: true});

  document.getElementById('content').innerHTML =
    marked.parse(  document.getElementById('content').innerHTML);
</script>
EOF
puts '</body>'
puts '</html>'