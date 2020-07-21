# Alpha Blog

Rails 6 and Bootstrap for [The Complete Ruby on Rails Developer Course](https://github.udemy.com/course/the-complete-ruby-on-rails-developer-course).

This is a multi-user blog supporting interactive account signup, profile management, article creation/editing/deletion, and the ability to promote a user to having `admin` privileges via the `admin` attribute:

```
2.6.3 :007 > user
 => #<User id: 14, username: "admin", email: "admin@test.com", created_at: "2020-07-14 19:58:15", updated_at: "2020-07-14 19:58:23", password_digest: [FILTERED], admin: true>
2.6.3 :008 > user.admin?
 => true
 ```
 
To run:

1. Clone the repository
2. Navigate to the cloned repository and run `bundle install --without production`
3. Start the Rails server by running `rails s`
4. Navigate to `http://localhost:3000`

This is also deployable to Heroku, and requires the use of PostgreSQL in "production".
