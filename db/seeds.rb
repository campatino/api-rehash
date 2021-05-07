puts "Cleaning database..."
Hobby.delete_all
User.delete_all
puts "OK"

puts "Adding Users..."
john = User.create(name: 'John Doe' , document: '123' , sex: 'M', age: '29', height: '1.80 m')
dylan = User.create(name: 'Dylan Doe' , document: '456' , sex: 'M', age: '25', height: '1.83 m')
mike = User.create(name: 'Mike Doe' , document: '789' , sex: 'M', age: '33', height: '1.75 m')
misha = User.create(name: 'Misha Doe' , document: '147' , sex: 'F', age: '27', height: '1.65 m')
haruki = User.create(name: 'Haruki Doe' , document: '258' , sex: 'F', age: '21', height: '1.63 m')
puts "OK"

puts "Adding Hobbies to Users..."
john.hobbies.create(name: 'Reading books')
john.hobbies.create(name: 'Blogging')
john.hobbies.create(name: 'Dancing')
john.hobbies.create(name: 'Singing')
john.hobbies.create(name: 'Listening to music')
john.hobbies.create(name: 'Playing musical instruments')
john.hobbies.create(name: 'Learning new languages')
dylan.hobbies.create(name: 'Shopping')
dylan.hobbies.create(name: 'Traveling')
dylan.hobbies.create(name: 'Hiking')
dylan.hobbies.create(name: 'Cycling')
dylan.hobbies.create(name: 'Exercising')
dylan.hobbies.create(name: 'Drawing')
mike.hobbies.create(name: 'Painting')
mike.hobbies.create(name: 'Collecting things')
mike.hobbies.create(name: 'Playing computer games')
mike.hobbies.create(name: 'Cooking')
mike.hobbies.create(name: 'Baking')
mike.hobbies.create(name: 'Gardening')
mike.hobbies.create(name: 'Doing crafts')
mike.hobbies.create(name: 'Embroidering')
mike.hobbies.create(name: 'Sewing')
mike.hobbies.create(name: 'Knitting')
misha.hobbies.create(name: 'Playing board games')
misha.hobbies.create(name: 'Walking')
misha.hobbies.create(name: 'Writing stories')
misha.hobbies.create(name: 'Fishing')
misha.hobbies.create(name: 'Photography')
misha.hobbies.create(name: 'Skydiving')
haruki.hobbies.create(name: 'Skating')
haruki.hobbies.create(name: 'Skiing')
haruki.hobbies.create(name: 'Roller skating')
haruki.hobbies.create(name: 'Longboarding')
haruki.hobbies.create(name: 'Surfing')
puts "OK"

puts "seed completed :)"