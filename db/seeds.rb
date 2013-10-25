#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

   Authority.create(name: "查看帖子", pinyin: "show_post",   value: (2**0))
   Authority.create(name: "创建帖子", pinyin: "create_post", value: (2**1))
   Authority.create(name: "修改帖子", pinyin: "edit_post",   value: (2**2))
   Authority.create(name: "删除帖子", pinyin: "delete_post", value: (2**3))

   role = Role.new(name:"管理员")
   role.authorities << Authority.all
   role.save

   user = User.new(email: 'admin@gmail.com', password: '12345678')
   user.roles << Role.all
   user.save


