# Create a main sample user.
User.create!(   name: "Example User",
    email: "example@railstutorial.org",
    password:              "foobar",
    password_confirmation: "foobar")

Company.create!(name: "Example",
                addres: "Warsaw",
                nip: 12345667890,
                user: User.first)