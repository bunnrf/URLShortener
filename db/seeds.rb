# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: 'a@gmail.com')
user2 = User.create(email: 'b@gmail.com')
user3 = User.create(email: 'c@gmail.com')
user4 = User.create(email: 'd@gmail.com')
user5 = User.create(email: 'e@gmail.com')

short_url1 = ShortenedUrl.create_for_user_and_long_url!(user1, 'abcd.com')
short_url2 = ShortenedUrl.create_for_user_and_long_url!(user1, 'abcd.com')
short_url3 = ShortenedUrl.create_for_user_and_long_url!(user2, 'abcd.com')
short_url4 = ShortenedUrl.create_for_user_and_long_url!(user3, 'abcd.com')
short_url5 = ShortenedUrl.create_for_user_and_long_url!(user4, 'abcd.com')
short_url6 = ShortenedUrl.create_for_user_and_long_url!(user5, 'abcd.com')

visit1 = Visit.record_visit!(user1, short_url1)
visit2 = Visit.record_visit!(user1, short_url4)
visit3 = Visit.record_visit!(user1, short_url1)
visit4 = Visit.record_visit!(user2, short_url1)
visit5 = Visit.record_visit!(user3, short_url2)
visit6 = Visit.record_visit!(user4, short_url3)
visit7 = Visit.record_visit!(user4, short_url1)
visit8 = Visit.record_visit!(user5, short_url4)
visit9 = Visit.record_visit!(user5, short_url4)
visit10 = Visit.record_visit!(user5, short_url4)
visit11 = Visit.record_visit!(user5, short_url5)
visit12 = Visit.record_visit!(user5, short_url5)
visit13 = Visit.record_visit!(user5, short_url6)
