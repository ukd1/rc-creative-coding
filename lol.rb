puts '<html>'
puts '<head>'
puts '<meta charset="utf-8"/>'
puts '<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>'
puts '<title>RC Creative coding lol</title>'
puts '</head>'
puts '<body id="content">'
puts '<h1>RC Creative coding list of things</h1>'


def get_sketch_id(file)
  File.basename(file).split('.')[0].to_i
end
# we have to sort like this as we want a "natural sort" based on the actual number
# not the text of the filename
Dir.glob("sketches/*.md").sort_by{|file| get_sketch_id(file) }.reverse.each do |file|
  id = get_sketch_id(file)
  puts "<h2 id='#{id}'>#{file}</h2> <a href='##{id}'>🔗</a>"
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
