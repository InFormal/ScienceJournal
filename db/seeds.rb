# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#roles
Role.create(name: :guest)
Role.create(name: :author)
Role.create(name: :censor)
Role.create(name: :admin)

#Authors
author1 = Author.create(first_name: 'first_name', middle_name: 'middle_name', last_name: 'last_name')
Author.create(first_name: 'first_name1', middle_name: 'middle_name1', last_name: 'last_name1')

#users

User.create!(name: 'admin', email: 'duxcomus@mail.ru', password: 'adminadmin',
                     password_confirmation: 'adminadmin', role_ids: [Role.admin_role.id])

author_user = User.create!(name: 'author', email: 'author1@mail.ru', password: '123456',
                     password_confirmation: '123456', role_ids: [Role.guest_role.id ,Role.author_role.id])
author_user.update_attribute(:person, author1)

User.create!(name: 'censor', email: 'censor@mail.ru', password: '123456',
                     password_confirmation: '123456', role_ids: [Role.guest_role.id ,Role.censor_role.id])


#Categories
root = Category.create(title: 'root')
child1 = Category.create(title: 'child1')
top1 = Category.create(title: 'top1')
top2 = Category.create(title: 'top2')
top1.children = [child1]
root.children = [top1, top2]