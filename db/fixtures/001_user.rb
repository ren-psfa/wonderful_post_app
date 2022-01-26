3.times do |n|
  User.create!(
    email: "user00#{n+1}@test.com", password: "test1234", nickname: "user00#{n+1}"
    )
end


  User.all.each do |user|
  50.times do |n|
      user.articles.create!(
        title: "No.#{n+1}:" + user.nickname + "の記事です",
        content: "No.#{n+1}:" + user.nickname + "の記事の本文"
      )
    end
  end
