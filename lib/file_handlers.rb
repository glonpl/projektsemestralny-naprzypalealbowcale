def readFile(name)
  if name.length == 0
    raise ArgumentError, "File with empty name doesn't exist"
  end
  file = File.open('resources/' + name, "r")
  data = file.read
  file.close
  data
end

