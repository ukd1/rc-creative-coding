require 'erb'

def get_sketch_id(file)
  File.basename(file).split('.')[0].to_i
end

# we have to sort like this as we want a "natural sort" based on the actual number
# not the text of the filename
sketches = Dir.glob("sketches/*.md").sort_by{|file| get_sketch_id(file) }.reverse


# ERB template for the main page
#
main_template = ERB.new <<-EOF
<html>
<head>
  <title>RC Creative Coding Archive</title>
  <meta charset="utf-8"/>
  <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
</head>
<body>
  <h1>🐙 RC Creative Coding Archive 👋</h1>
  <p>This is an archive of creative coding things folks at RC have done (or found)! Please enjoy and share</p>

  <p>
    <a href="https://github.com/ukd1/rc-creative-coding/issues/new">Add something!</a>
    &mdash;
    <a href="https://github.com/ukd1/rc-creative-coding">The code</a>
    &mdash;
    <a href="https://www.recurse.com">Recurse Center</a>
  </p>

  <br>

  <%= sketches_html %>

  <script>
    marked.setOptions({gfm: true, breaks: true});

    document.querySelectorAll('.md').forEach((block) => {
      block.innerHTML = marked.parse(block.innerHTML);
    });
  </script>
</body>
</html>
EOF

# ERB template for the individual sketchs
#
sketch_template = ERB.new <<-EOF
  <div id="sketch_<%= id %>">
    <h2><%= file %></h2> <a href='#sketch_<%= id %>'>🔗</a>
    <div class='md'><%= File.read(file) %></div>
    <br>
  </div>
EOF


# map over each sketch
sketches_html = sketches.map do |file|
  id = get_sketch_id(file)

  # and render the template...
  sketch_template.result(binding)
end.join("\n") # then join each sketch by new lines... 😅

# just puts the output, as we're prolly just gonna write to a file
puts main_template.result(binding)

