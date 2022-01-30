User.all.each do |user|
  50.times do |n|
    user.articles.create!(
      title: "No.#{n+1}:" + user.nickname + "の記事です",
      content: "No.#{n+1}:" + user.nickname + "の記事の本文"
    )
  end
end


Article.all.each do |article|
  article.tags.create!(name: "foo")
  article.tags.create!(name: "筋トレ")
  article.tags.create!(name: "スポーツ")
  article.tags.create!(name: "勉強")
  article.tags.create!(name: "健康")
end
