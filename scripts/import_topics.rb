lines = File.read("topics.csv").split("***")

lines[1..-1].each do |line|
  row = line.split("???")
  Topic.create(
    name: row[0].strip.gsub(/[,"]/, ''),
    course: Course.find_by(name: 'Web development for moms in 60 days')
  )
end
