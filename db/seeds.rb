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
m1 = Marker.new()
m1.name = "marker1"
m1.posX = 27.173006
m1.posY = 78.042086
m1.url = "desc/marker1"
m1.save

m2 = Marker.new()
m2.name = 'marker2'
m2.posX = 28.173006
m2.posY = 79.042086
m2.url = 'desc/marker2'
m2.save


m3 = Marker.new()
m3.name = 'marker3'
m3.posX = 26.173006
m3.posY = 76.042086
m3.url = 'desc/marker3'
m3.save

m4 = Marker.new()
m4.name = 'marker4'
m4.posX = 28.673006
m4.posY = 77.042086
m4.url = 'desc/marker4'
m4.save

m5 = Marker.new()
m5.name = "marker5".to_s
m5.posX = 23.173006
m5.posY = 79.042086
m5.url = 'desc/marker5'
m5.save
puts "Liczba markerow " + Marker.count.to_s

Rate.delete_all
r1 = Rate.create([{sum:5.0 , votes:1, marker:m1 }])
r2 = Rate.create([{sum:5.0 , votes:1, marker:m2 }])
r3 = Rate.create([{sum:5.0 , votes:1, marker:m3 }])
r4 = Rate.create([{sum:5.0 , votes:1, marker:m4 }])
r5 = Rate.create([{sum:5.0 , votes:1, marker:m5 }])
puts "Liczba ocen " + Rate.count.to_s

Post.delete_all
p1 = Post.create([{who:"admin", text:"Pierwszy komentarz", }])
p1 = Post.create([{who:'adam', text:'Drugi komentarz'}])
p1 = Post.create([{who:'zosia', text:'Trzeci komentarz'}])
p1 = Post.create([{who:'ania', text:'Kolejny komentarz'}])
p1 = Post.create([{who:'maciek123', text:'Komentarz'}])
puts "Liczba komentarzy " + Post.count.to_s