# README

Learning App for [Moms Learn to Code](https://www.momslearntocode.com)

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

### Add heroku remotes
<!-- 
Using [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli):

```shell
heroku git:remote -a project
heroku git:remote --remote heroku-staging -a project-staging
```
 -->

## Serve

```shell
rails s
```

## Deploy

### With Heroku pipeline

## Heroku
```git push heroku main```

#### Run production console from command line
```heroku run --app=mltc-learning-app rails c```

#### Run scripts from command line
```heroku run bundle exec rails runner ./scripts/YOUR_SCRIPT.rb -a mltc-learning-app```
```heroku config:add MLTC_USERNAME=USERNAME --app=mltc-learning-app```
```heroku config:add MLTC_PASSWORD=PASSWORD --app=mltc-learning-app```

<!-- Push to Heroku staging remote:

```shell
git push heroku-staging
```

Go to the Heroku Dashboard and [promote the app to production](https://devcenter.heroku.com/articles/pipelines) or use Heroku CLI:

```shell
heroku pipelines:promote -a project-staging
```

### Directly to production (not recommended)

Push to Heroku production remote:

```shell
git push heroku
``` -->
