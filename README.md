# README

Learning App for [Moms Learn to Code](https://www.momslearntocode.com), find it at https://learn.momslearntocode.com.

[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)


## Install

### Clone the repository

```shell
git clone git@github.com:hhar/mltc_learning_app.git
cd mltc_learning_app
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.0.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

<!-- ### Set environment variables

Using [Figaro](https://github.com/laserlemon/figaro):

See [config/application.yml.sample](https://github.com/juliendargelos/project/blob/master/config/application.yml.sample) and contact the developer: [contact@juliendargelos.com](mailto:contact@juliendargelos.com) (sensitive data). -->

### Initialize the database

```shell
rails db:create db:migrate db:seed
```


## Serve

```shell
rails s
```

## Deploy

### With fly

```shell
fly deploy
```

## Rails Console

### Locally

```shell
rails console
```

### On Fly.io (production)

```shell
fly ssh console --pty -C "/app/bin/rails console"
```

> The `--pty` flag is required to allocate a pseudo-TTY, otherwise IRB raises an `Errno::ENOTTY` error.

## Lesson Materials

### Editing via the UI (recommended)

You must be logged in as an admin. Navigate to:

```
/lessons/<lesson_id>/materials/<material_id>/edit
```

To list all materials for a lesson:

```
/lessons/<lesson_id>/materials
```

### Editing via the Rails console

**Find a material:**

```ruby
# By lesson name
lesson = Lesson.find_by(name: "HTML and CSS Introduction")
lesson.materials

# Find a specific task material
task = lesson.materials.where(type: "TaskMaterial").first
# or by id
task = TaskMaterial.find(87)
```

**View content:**

```ruby
task.body.to_plain_text
task.body.body.to_html
```

**Update content:**

```ruby
task.body = "<ol><li>New task text</li></ol>"
task.save!
```

**Find and replace within existing content:**

```ruby
new_html = task.body.body.to_html.gsub("old string", "new string")
task.body = new_html
task.save!
```

> Always assign to `task.body =` directly (not `task.body.body =`), otherwise Rails won't detect the change and won't save it.

### Creating a material via the console

```ruby
lesson = Lesson.find_by(name: "My Lesson")
TaskMaterial.create!(lesson: lesson, body: "<ol><li>Task 1</li></ol>")
```

### Adding a course to a user

```ruby
user = User.find_by(email: "user@example.com")
user.courses << Course.find_by(title: "Course Title")
# or explicitly:
Subscription.create!(user: user, course: Course.find(1))
```
