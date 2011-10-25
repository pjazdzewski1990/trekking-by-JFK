# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
#cities = User.create([{ name: 'test', pass: Digest::MD5.hexdigest('test').to_s }])
u = User.create([{ name: 'test', pass: 'test' }])
puts "Liczba userow " + User.count.to_s

Marker.delete_all
m1 = Marker.create([{name:'marker1', posX:27.173006, posY:78.042086, url:'desc/marker1'}])
m1 = Marker.create([{name:'marker2', posX:25.173006, posY:80.042086, url:'desc/marker2'}])
m1 = Marker.create([{name:'marker3', posX:30.173006, posY:75.042086, url:'desc/marker3'}])
m1 = Marker.create([{name:'marker4', posX:26.173006, posY:88.042086, url:'desc/marker4'}])
puts "Liczba markerow " + Marker.count.to_s