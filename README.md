# AutoScopes
[![Build Status](https://travis-ci.org/victor95pc/auto-scopes.svg?branch=master)](https://travis-ci.org/victor95pc/auto-scopes)
[![Dependency Status](https://gemnasium.com/victor95pc/auto-scopes.svg)](https://gemnasium.com/victor95pc/auto-scopes)

Recycle already defined scopes on multiple models whatever the association are, making your models way more DRYer

I always wonder if it is possible to reuse some scopes defined in a deep associations, we all know that is possible using merges but it still not a clean solution, I still need to define new scopes and make joins so Rails can know which model I want, so I started to develop this gem, the idea is easy to follow, put all scopes you want inside a YAML file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'auto_scopes'
```

And then execute:

    $ bundle


## Requirements

- Rails 3.2.x or Rails 4.x

- Ruby >= 2.0.0


## Usage

After you install AutoScopes and add it to your Gemfile, you need to run the generator:

```console
rake auto_scopes:install
```

The generator will install an initializer with some instructions and a YAML 


Once you setup everything, time to learn how recycle your scopes, first you must open the generated file in config/autoscopes.yml, I will try to explain using a example:

**Models:**
```ruby
class Ceo < ActiveRecord::Base
	has_many :companies
  end
end
```

```ruby
class Company < ActiveRecord::Base
  belongs_to :ceo
  has_many :employeds
end
```
```ruby
class Employed < ActiveRecord::Base
  belongs_to :company

  def self.by_name(name)
  	where(name: name)
  end

  def self.age(age)
  	where(age: name)
  end
end
```
If you want to get a CEOs by a employed´s name or age, you must write your auto_scopes file like this one:
```yaml
# config/auto_scopes.yml
Ceo:
  companies:
    employeds:
    - by_name
    - age
```

Doesn't matter the deepness of your association, auto_scopes will make joins to there, and call merge, it will produce 2 methods inside CEO´s model:

```ruby
# app/models/ceo.rb
def self.by_name(name)
  joins(companies: :employeds).merge(Employed.by_name(name))
end

def self.age(age)
  joins(companies: :employeds).merge(Employed.age(age))
end
```

AutoScopes also will create scope for each association, for example
```ruby
# app/models/ceo.rb
def self.by_companies(id)
  joins(:companies).where('companies.id = ?', id)
end

def self.by_employed(id)
  joins(companies: :employeds).where('employeds.id = ?', id)
end
```

If you dont want this behavior you can set the option create_scope_for_association to false
```ruby
# config/initializers/auto_scopes.rb
AutoScopes.setup do |c|
	c.create_scope_for_association = false
end
```

## Contributing

1. Fork it ( https://github.com/victor95pc/auto-scopes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Report issues or feature requests to [GitHub Issues](https://github.com/victor95pc/auto-scopes/issues).

## License

<tt>AutoScopes</tt> is Copyright (c) 2015 Victor Palomo de Castro. This is Free Software distributed under the MIT license.