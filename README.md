# Rails generator for Domain-driven design application

![Demo](https://media.giphy.com/media/J4ssLyT6AGr8dX1tCW/giphy.gif)

# Supporting Rails 3.2.0 or above

# How to use

1. Install:
```
$ gem install domain-generator
```
2.  Gemfile:
```ruby
gem 'domain-generator', '~> 0.1.0'
```
3. Build the gem yourself:
```
$ gem build domain-generator.gemspec
```
3. Try it out:
```
$ rails generate domain [DOMAIN_NAME] [options]
```
### Options
1. `--include-dry` | `--no-include-dry`
    - Generate class and spec with [dry-monads](https://dry-rb.org/gems/dry-monads)
2. `--repo` | `--no-repo`
    - Generate repository class for the model
3. `--app-service`
    - Generate the application service class
4. `--service`
    - Generate the service class
5. `--model`
    - Generate the Entity / Model class
### To generate everything
![All](https://media.giphy.com/media/h2OFhJeYBdPzXqyLrU/giphy.gif)
### To generate model without repository
![No Repo](https://media.giphy.com/media/dzPGZiK5sWSsYzh9I3/giphy.gif)
### You can also just generate a particular class and spec
![App Service](https://media.giphy.com/media/frHRLBfe7wqfobN51H/giphy.gif)
### It won't generate anything if only domain name is provided
![Nothing](https://media.giphy.com/media/kdLVazlxTqX24tk4bw/giphy.gif)
### Of course all of them can be deleted easily
![Delete](https://media.giphy.com/media/jqk7Z6AzaguUNCdn5g/giphy.gif)
### Folder structure:
#### App:
```
app/domain
└── pet_management
    ├── app_services
    │   └── register_dog.rb
    ├── infrastructures
    │   └── repos
    │       └── dog.rb
    └── services
        ├── models
        │   └── dog.rb
        └── validate_dog.rb
```
#### RSpec:
```
spec/domain
└── pet_management
    ├── app_services
    │   └── register_dog_spec.rb
    ├── infrastructures
    │   └── repos
    │       └── dog_spec.rb
    └── services
        ├── models
        │   └── dog_spec.rb
        └── validate_dog_spec.rb
```
#### A model factory to give you a starting point with [FactoryBot](http://github.com/thoughtbot/factory_bot_rails)
```
test/factories
└── Dog.rb
```
___
## TODO:
1. Generate class and spec seperately.
2. Validate arguements must be in CamelCase.
3. Generate repository class without dry stuff.
4. Depends on what's on the issue list I guess.