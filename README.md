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
