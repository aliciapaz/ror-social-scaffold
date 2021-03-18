FactoryBot.define do
  
  factory :user1, class: "User" do
    name {"Jenny"}
    email {"jenny@gmail.com"}
    password {"password"}
  end

  factory :user2, class: "User" do
    name {"John"}
    email {"john@gmail.com"}
    password {"password"}
  end

  factory :user3, class: "User" do
    name {"Foo"}
    email {"foo@gmail.com"}
    password {"password"}
  end

end