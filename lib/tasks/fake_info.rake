namespace :db do
  require 'faker'
  desc "產生假會員-Blog-Article"
  task :fake_data => :environment do

    if User.where(email: "fake@a").nil?
      1.times do
        User.create!(
                    email: "fake@a",
                    password: "111111")
      end

      puts "帳號：a@a、密碼：111111"
    end

    user_number = User.all.size

    4.times do |n|
      User.create!(
                  email: "fake#{n+1+user_number}@a",
                  password: "111111")
    end

    puts "user ok"

    user_id = User.ids

    10.times do
      Blog.create!(
                    title: Faker::Book.title,
                    content: Faker::Movie.quote,
                    user_id: user_id.sample)
    end

    puts "blogs ok"

    # blog_id = Blog.ids

    # 5.times do
    #   Article.create!(
    #     title: Faker::Book.title,
    #     content: Faker::Movie.quote,
    #     blog_id: blog_id.sample)
    # end

    # Article.all.sample(3).each { |article| article.publish = 0 }

    # puts "articles ok"

    puts "完成"
  end
end