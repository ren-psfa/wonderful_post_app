3.times do |n|
  User.create!(
    email: "user00#{n+1}@test.com", password: "test1234", nickname: "user00#{n+1}"
    )
end
