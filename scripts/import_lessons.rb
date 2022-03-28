lines = File.read("./scripts/lessons.csv").split("***")

lines[1..-1].each do |line|
  row = line.split("???")

  lesson = Lesson.create(
    name: row[0].strip.gsub(/[,"]/, ''),
    topic: Topic.find_by(name:row[1].strip.gsub(/[,"]/, ''))
    )
  # This gets the video links
  html = Nokogiri::HTML(row[2].gsub('""', '"'))
  link = html.xpath("//video/source/@src").first.to_s[0...-4]

  VideoMaterial.create(
    body: link,
    lesson: lesson
  )
end
