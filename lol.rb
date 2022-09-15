puts '<html>'
puts '<head>'
puts '<meta charset="utf-8"/>'
puts '<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>'
puts '<title>RC Creative coding lol</title>'
puts '</head>'
puts '<body id="content">'
puts '<h1>RC Creative coding list of things</h1>'

# we have to sort like this as we want a "natural sort" based on the actual number
# not the text of the filename
Dir.glob("sketches/*.md").sort_by{|f| File.basename(f).split('.')[0].to_i }.reverse.each do |file|
  puts "<h2>#{file}</h2>"
  puts "<div class='md'>#{File.read(file)}</div>"
  puts "<br>"
end

puts <<-EOF
<script>
  marked.setOptions({gfm: true, breaks: true});

  document.querySelectorAll('.md').forEach((block) => {
    block.innerHTML = marked.parse(block.innerHTML);
  });
</script>
EOF
puts '</body>'
puts '</html>'
