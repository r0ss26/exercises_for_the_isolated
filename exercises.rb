require 'json'
file = File.read('exercises.json')
exercise_hash = JSON.parse(file)
puts exercise_hash.sample