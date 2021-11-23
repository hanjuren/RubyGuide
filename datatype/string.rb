string = <<End
hello my name is han juryeon \nmy job is programer '<<'
End
puts string

print <<-STRING1, <<-STRING2
  concat
STRING1
  enate
STRING2

str = "dog"
puts RUBY_VERSION
puts "#{str} : #{str.encoding}"

Song = Struct.new(:title, :name, :length)
p Song
File.open("./song.txt") do |file|
  songs = Array.new

  file.each do |line|
    file, length, name, title = line.chomp.split(/\s*\|\s*/)
    name.squeeze!(" ")
    time = length.split(/\s*\:\s*/)
    min = Integer(time[0]) * 60
    sec = Integer(time[1])
    songs << Song.new(title, name, min + sec)
  end
  p songs
end