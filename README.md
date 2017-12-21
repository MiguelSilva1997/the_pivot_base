## Little Shop (The Pivot)
Little Shop builds upon an existing implementation of Little Shop. We took an application that only supported one store to an e-commerce platform that can handle multiple, simultaneous businesses. Each business has their own name, unique URL pattern, items, orders, and administrators.

During this project, the Pivot team:

Used TDD to drive all layers of Rails development including unit and integration tests
Designed a system of models which used one-to-one, one-to-many, and many-to-many relationships
Practiced mixing HTML, CSS, and templates to create an inviting and usable User Interface
Deployed an application to Heroku
Exercised ActiveRecord and SQL queries.

## Setup

Built using Ruby 2.4.1 and Rails 5.1.3

Install required gems:
`$ bundle install`

Load the database dump:
`$ rake import_dump:load`

After the import you should see a return value of 1011 when running `Item.count` in the console.

All users have a password of `password` if you want to login and explore.
