FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    first_name{"じょん"}
    last_name{"だい"}
    first_name_jpn{"ジョン"}
    last_name_jpn{"ダイ"}
    birthday{"1996-06-29"}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end