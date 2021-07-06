# Intro to ActiveRecord

ActiveRecord is an ORM (Object Relational Mapping) library. It's purpose is to give you a set of methods that make assumptions about your code and your database structure to give you a set of methods for interacting with your database to accomplish common CRUD tasks using Ruby code. ActiveRecord will generate SQL queries based on the context of a method call. The key assumptions that ActiveRecord makes are these:
- An ActiveRecord model will have a class name that is `UpperCamelCaseSingular`. This class name will correspond to a database table of the same name but plural: `lower_case_snake_case_plural`. For example, a `SongGenre` class would have a corresponding `song_genres` table. You don't technically have to follow this pattern, as there is a method that ActiveRecord provides for [overriding the table name](https://apidock.com/rails/v5.2.3/ActiveRecord/ModelSchema/ClassMethods/table_name), but far more often than not you will follow this pattern when you use ActiveRecord.
- ActiveRecord assumes that you'll want getter and setter methods for all of the attributes that correspond to column names in the table associated with a model. When you use ActiveRecord methods to find and create objects, the keys in those hashes will often correspond exactly to columns in the associated table.
- Also, file names become quite important later on when you begin using ActiveRecord with Rails. In that case, the file name for a model should be lower case snake case singular matching the name of the class defined therin. For example, the file name for the `SongGenre` class would be `song_genre.rb`.
- When it comes to building association methods with ActiveRecord there are some additional assumptions we'll talk more in depth about tomorrow. These are also focused on naming conventions for Foreign and Primary keys. Again, while you can override these assumptions, for the most part, following naming conventions will help keep your code clean, readable and easy to understand. Still, it's important to understand how the conventions are working for you so that you understand when you're in a situation  when you need to break them.
- Finally, we want to be able to collaborate in our development with other engineers. So, instead of opening up a console and setting up and changing our database via a CLI, ActiveRecord expects that we create a series of files called migrations that describe the changes to our database that happen over time. As we run migrations, they update the version of our database schema. ActiveRecord, in turn, can use this version to ensure that other developers get a warning if the database structure has changed to support the new code they just pulled down from GitHub. That way, if I add a migration, push my code to GitHub and then you pull it down to keep working, you will be notified you that you have pending migrations that need to run if you try to keep working on the code without running the migration on your machine to make sure your database structure on your computer matches the structure on mine.
- Again, file names are important here. So, we can use a command line tool called `rake` to help us generate files with the appropriate names in the appropriate directory so that ActiveRecord knows what to do. There is a set of rake tasks that we'll be using that come from `require 'sinatra/activerecord/rake'`

## Important rake commands

| Task | command | notes |
| ---- | --- | --- |
|list rake tasks| `rake -T`| prints a list of all rake tasks we have available to us in the current project. This list is affected by the contents of the `Rakefile` in the root of our project.|
|Create Migration|`rake db:create_migration NAME="create_users"` | takes a name as an argument and creates a migration file with a class inside matching that name. The file will contain code that we can use to change the structure of our database.|
|Run Migration|`rake db:migrate`|this command will update our schema to match the version of our latest migration. Migration files all start with a number (usually a timestamp of when the migration was created). When we run a migration, the database structure will update and the schema version will change to match the number at the beginning of the migration filename.|
|Revert Migration|`rake db:rollback`|runs a migration in reverse. If you've already run a migration and you realize you made a mistake, you'll first want to revert the changes made by the current migration by running this command. *After* rolling back the migration, you can make the change to the file and run `rake db:migrate` again. **Running `rake db:migrate` again without rolling back the change first won't update the database!** This is because activerecord keeps track of the schema version in the database in order to decide which migrations to run. If the schema version matches the migration file name, then the migration will be skipped, so any changes to it won't happen. This is necessary because, as we saw earlier, SQL commands that change the structure of the database can sometimes raise exceptions if you run them twice on the same database.|
|Adding Seed Data to the database|`rake db:seed`|This command interacts with a file called `db/seeds.rb`. That file will contain ruby code that will add data to our database tables. This is used so that we can share starter data for our projects with others so they are quickly able to try out our application locally and see how it works without having to start completely from scratch. |
|Loading the database structure of a large project on a new machine|`rake db:schema:load`|This command loads the tables described in the `db/schema.rb` rather than running your migrations one at a time. In a project that has hundreds of migrations, this will run much more quickly and it will also be more reliable|


## Important Files
|File|Purpose|
|----|----|
|Rakefile|Define rake tasks that will be accessible in this project|
|db/schema.rb|Describes the structure of our database including the names of tables and their columns and types. This file is auto-generated when we run `rake db:migrate` and should not be edited directly.|
|db/seeds.rb|File containing ruby code that will seed the database with starter data. Used for any kind of data that we may not want to create a user interface for right away. It could be used to create categories or tags or other model objects that would be used to create associations when users interact with our application.|
|db/migrate/|This is the directory that contains all of our migration files. Migration files all begin with a number (usually a timestamp if we used `rake db:create_migration` to create the migration). ActiveRecord uses this number to generate the version of our database schema (also visible in the schema.rb file). When we run `rake db:migrate` ActiveRecord will look at our database schema version and then run all of the migrations within `db/migrate` that begin with a number **greater** than the current schema version. After the update the schema version will match the number of the last filename in `db/migrate`.|

## AAAAHHH! I Screwed Up my Database!!!

The nuclear option for this (only for use in development with sqlite at the very early stages of a project).

- delete `db/schema.rb`
- delete `db/development.sqlite`
- run `rake db:migrate` again

Otherwise, you'll want to use the `rake db:rollback` command to revert an offending migration, fix it and run it again–or remove it it's no longer necessary.

## Understanding the Idea of a Model

A model is a class that describes a type of object in our program. A model is what we call one class that makes up part of a domain model. Here are some sample domain models:

#### Chat App
- User
- Conversation
- Message

#### Blog
- User
- Post
- Comment

#### Appointment Tracker
- User
- Appointment 
- Location

#### Store
- Customer
- Order
- Product

#### Music Library
- Song
- Artist
- Genre
- SongGenre? (If we want to allow songs to have more than one genre)

## We use ActiveRecord::Base to build Model classes that have database backing.

Back when we were building out our Twitter app, we were repeating ourselves frequently. With each of our classes, we added in the following code:

```rb
class Tweet 
    @@all = []
    
    def self.all 
        @@all
    end
end

class User 
    @@all = []
    
    def self.all 
        @@all
    end
end

class Like 
    @@all = []
    
    def self.all 
        @@all
    end
end
```

The purpose of this code was to keep track of all instances that we've created so we could access associated data. One of the fundametal ways we avoid repeating code in Ruby is through inheritance. The `ActiveRecord::Base` class contains a bunch of reusable methods that handle common tasks related to database persistence. Let's say we wanted to create a `Book` class that could interact with our database. We can create a `Book` class that inherits from ActiveRecord like so:

```rb
class Book < ActiveRecord::Base

end
```
Take a look at the table below for a sampling of the methods we'd get access to:

|CRUD|Method|Arguments|Return value|Type|
|----|----|----|----|----|
|Create|`Book.new(attributes)`|takes a hash of attributes whose keys are setter methods in the Book class.|Returns a Book instance after all of the setter methods have been invoked on the Book. The book will not be saved to the database, so it will not have an id attribute yet.|Initialize|
|Create|`Book.create(attributes)`|same as new above|Same return value as above but this time the Book will be persisted to the database and the returned Book object will have the id assigned by the db.|Class method|
|Create/Update|`@book.save`|none|If @book is already saved to the database, this will trigger an update query. If not, `save` triggers an insert, creating a new row in the appropriate table. Returns `false` if any validations attached to the Book class fail for this instance. Returns `true` if the book saves successfully.|Instance method|
|Read|`Book.all`|none|an ActiveRecord::Relation containing a collection of Book instances built from data stored in the books table.|Class method|
|Read|`Book.find(1)`|id|returns a Book instance with the id matching the value passed as an argument. This method raises an `ActiveRecord::RecordNotFound` exception if there is no row in the database with a matching id.|Class method|
|Read|`Book.find_by(title: "The Lord of the Rings")`|a hash - keys are column names, corresponding values will be used in query to find the row that has those values for those columns.|A Book instance built from the first record in the books table that has a value in the title column "The Lord of the Rings" If no record is found, this method returns `nil` |Class method|
|Create/Read|`Book.find_or_create_by(title: "The Lord of the Rings")`|a hash - keys are column names, corresponding values will be used in query to find the row that has those values for those columns. If no row is found, a new one will be inserted with those values.|A Book instance built from the first record in the books table that has a value in the title column "The Lord of the Rings" If no record was found, this method returns a Book instance based on the newly inserted row. |Class method|
|Read|`Book.where(author: "JRR Tolkien")`|hash of attributes - same as find_by above.|An `ActiveRecord::Relation` containing a collection of all books where the `author` column has a value of `"JRR Tolkien"`|Class method|
|Update|`@book.update(sold: true)`|a hash of attributes where the keys are the columns to be updated and the corresponding values the desired new column values.|updates the row corresponding to the `@book` in the `books` table. Returns `true` if the update is successful or `false` if validation failures prevent the book from updating.|Instance method|
|Delete|@book.destroy|none|The row in the database associated with `@book` will be deleted and the `@book` object itself will be returned.|Instance method|
|Delete|[`Book.destroy_all`](https://apidock.com/rails/ActiveRecord/Relation/destroy_all)|none|Destroys all records in the `books` table and returns|Class method|

Before these will work for us, however, we'll need to create a table called `books` that has the appropriate attributes: `title`, `author`, and `sold`.

We'll also need to ensure that `ActiveRecord::Base` has a connection to our sqlite database. We do this by using the [`establish_connection`](https://apidock.com/rails/ActiveRecord/ConnectionHandling/establish_connection) method like so:

```rb
ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/intro_to_activerecord.sqlite"
)
```

But first, we also have to actually load up ActiveRecord into our project. For our purposes here, we'll be loading ActiveRecord via the `sinatra-activerecord` gem. This is what the Gemfile looks like:

```rb
source "https://rubygems.org"


gem "rake", "~> 12.0"
gem "rspec", "~> 3.0"

gem "pry", "~> 0.14.1"

gem "activerecord", "~>5.2"
gem "sinatra-activerecord", "~> 2.0"

gem "sqlite3", "~> 1.3.6"
```

With those gems installed, you'll want to require ActiveRecord within the main project file:

```rb
# lib/intro_to_activerecord
require "sinatra/activerecord"
require_relative "intro_to_activerecord/version"
require_relative "intro_to_activerecord/exercise"
require_relative "intro_to_activerecord/examples"


ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/intro_to_activerecord.sqlite"
)

module IntroToActiverecord
  class Error < StandardError; end
  # Your code goes here...
end

```

Before booting up the console, let's add this code to `lib/intro_to_activerecord/examples.rb`:

```rb
class Book < ActiveRecord::Base 

end
```


Now, let's boot up the console by running `./bin/console` and let's try to make a new Book instance:

```rb
book = Book.new
```

This time, we're going to get an error! At the bottom of the stack trace, we'll see something like this:

```
ActiveRecord::StatementInvalid (Could not find table 'books')
```

This is our naming convention in action. We have a `Book` class, so ActiveRecord is looking for a `books` table. But, we don't have one yet, so for that we'll need to create a migration to do that. Now would be a good time to run `rake -T` to go looking for the right rake task to help with this. In the list, we'll see this line:

```rb
rake db:create_migration    # Create a migration (parameters: NAME, VERSION)
```

In our case, we want to create a `books` table, so let's run:

```rb
rake db:create_migration NAME=create_books
```

This command does a couple of things. Because this is our first migration, it will create the `db/migrate` directory. Then, inside of that directory it will create a file for our migration with a timestamp in front of the name we passed in.

```rb
# db/migrate/20210614080432_create_books.rb
class CreateBooks < ActiveRecord::Migration[5.2]
  def change
  end
end
```

While you can create migration files yourself, so many things here have to be done exactly right for ActiveRecord to be able to put the pieces together. So, it's recommended to use this `rake` task to generate migrations. The key important pieces are:
- File name must begin with a number (this will be the version of the schema when we run this migration). File must be located within `db/migrate`.
- class name must match the word part of the file name. File name will be `lower_snake_case`. Class name will be `UpperCamelCase`.
- The class will define a `change` method that describes how this migration will change the database. You can also define `up` and `down` methods if the change isn't obviously reversible and you need to specify explicit instructions for running the migration forwards and backwards. Otherwise, ActiveRecord will attempt to invert the change when rolling back a particular migration.

Using `rake`, we get all of these done corectly with minimal effort.

Within the change method, we can invoke [methods to change the structure of our database](https://edgeguides.rubyonrails.org/active_record_migrations.html). In our case, we need to create a new table, so we'll use the `create_table` method. We need 3 columns in our books table: title (string), author (string), & sold (boolean).

```rb
# db/migrate/20210614080432_create_books.rb
class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :sold
    end
  end
end
```

Notice that the `create_table` method accepts 2 arguments: 
1. The name of the table to be created (usually as a symbol)
2. a block of code to which a table builder object is yielded. The table builder object (t in our case) can be used to create different types of columns within this new table. We can also add options here as a second argument. Some examples would be `default: false` to give a column a default value of `false`, or `null: false` to specify that this column should never be empty and an exception should be raised if we try to insert a row without a value for this column.

Now, we run the migration by using the `rake` task:

```bash
rake db:migrate
```

If all is well you should see something like this:

```bash
== 20210614080432 CreateBooks: migrating ======================================
-- create_table(:books)
   -> 0.0010s
== 20210614080432 CreateBooks: migrated (0.0011s) =============================
```

Now, let's try to hop back into the console and see if we can create a book. `./bin/console`:
```rb
book = Book.new(title: "The Lord of the Rings", author: "JRR Tolkien")
 => #<Book id: nil, title: "The Lord of the Rings", author: "JRR Tolkien", sold: nil> 
```
If we check our database in sqlite explorer, we'll see that our books table is currently empty. Then, if we call `.save` on the book, like so:

```rb
book.save
```

we'll see something like this:
```
D, [2021-06-14T01:36:30.086809 #69840] DEBUG -- :    (0.2ms)  begin transaction
D, [2021-06-14T01:36:30.103078 #69840] DEBUG -- :   Book Create (3.7ms)  INSERT INTO "books" ("title", "author") VALUES (?, ?)  [["title", "The Lord of the Rings"], ["author", "JRR Tolkien"]]
D, [2021-06-14T01:36:30.104268 #69840] DEBUG -- :    (1.0ms)  commit transaction
 => true 
```

We get true back because the `book` saved successfully. If we check the Sqlite explorer now, we should have a single row in the books table.

## Validations

Let's say we want to protect our database from bad data. To do that, we can use built in methods called validators to apply validations to our columns. Validations will run whenever an object is about to be saved to the database, so they're a great way to ensure that incomplete records that are missing required information don't find their way into the database. Here's an example of the syntax:

```rb
class Book < ActiveRecord::Base
  validates :title, :author, presence: true
end
```

The first arguments to `validates` are the names of the columns to which we'd like to add validations. The last argument is a hash containing all of the validations we'd like to apply. You can read about all of the different kinds of validations on the [rails guides on validations](https://guides.rubyonrails.org/v5.2/active_record_validations.html#validation-helpers).

#### Questions:
1. What happens if we try to create a Book without a title?
2. What if we want to make sure that the same author can't release the same book title twice?
3. If an ActiveRecord validation fails, how do we know about it and how can we see the error message itself?
## Exercise

- Create a `Task` model that inherits from `ActiveRecord::Base`
- [Create a migration](https://edgeguides.rubyonrails.org/active_record_migrations.html) that creates the `tasks` table with the following columns:
    - title (string) *required*
    - description (text)
    - complete (boolean) *required* [**default: false**](https://api.rubyonrails.org/classes/ActiveRecord/Migration.html)
- Define a method `learning_activerecord` that creates a new `Task` with a title of `"Learn about ActiveRecord"`
- Define a method `i_think_i_get_it` that finds the task with a title of `"Learn about ActiveRecord"` and updates its complete attribute to `true`.
- Define a method `moving_on` that finds the task with a title of `"Learn about ActiveRecord"` and removes its corresponding database record.