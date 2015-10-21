100.times  do
command = Cmd.new
command.name = ["rails generate controller Name action", "rails generate model Class attributes:datatype", "rails generete migration FileName", "rails new AppName", "rails server -port", "rails console", "rails destroy controller Name action", "rails destroy model Class attributes:datatype", "rake", "rake db:migrate", "rake db:rollback"].shuffle.first
command.option = Faker::Internet.slug
command.description = Faker::Lorem.paragraph(5)
command.user_id = User.order("RANDOM()").first.id
command.save
end

100.times  do
convention = Convention.new
convention.ctlr = ["Say", "Commands", "Conventions", "Methods", "Errors", "Users", "Admins", "Managers"].shuffle.first
convention.action = ["hello", "index", "new", "create", "show", "edit", "update", "destroy"].shuffle.first
convention.views = ["hello", "index", "new", "create", "show", "edit", "update", "destroy"].shuffle.first
convention.uri = "#{convention.ctlr}/#{convention.action}"
convention.description = Faker::Lorem.paragraph(5)
convention.user_id = User.order("RANDOM()").first.id
convention.save
end

100.times  do
mdh = Mhd.new
mdh.name = ["each", "shuffle", "first", "last", "order", "find", "where", "destroy", "delete_all", "limit"].shuffle.first
mdh.type = ["instance", "Class", "Instance-Boolean"].shuffle.first
mdh.value = [":table_name", ":column_name", "DESC", ":column_type"].shuffle.first
mdh.description = Faker::Lorem.paragraph(5)
mdh.user_id = User.order("RANDOM()").first.id
mdh.save
end

100.times  do
eror = Eror.new
eror.name = Faker::Internet.slug
eror.description = Faker::Lorem.paragraph(5)
eror.cause = Faker::Lorem.sentence(3)
eror.fix = Faker::Lorem.sentence(3)
eror.user_id = User.order("RANDOM()").first.id
eror.save
end