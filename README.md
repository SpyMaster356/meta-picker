# Meta::Picker

Add easy access to a given pages's meta data. Has filters for twitter cards, and open graph meta data.

## Installation

Add this line to your application's Gemfile:

    gem 'meta-picker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install meta-picker

## Usage
  
    # create MetaPicker client and pass it a webpage
    picker = MetaPicker.new(http://www.example.com)

    #retrive all twitter card data
    tc = picker.twitter_card
    tc.title            #=> "Example twitter title"
    tc.description      #=> "Example twitter description"

    #retrive all open graph meta data
    og = picker.og_data
    og.title            #=> "Example open graph title"
    og.description      #=> "Example open graph description"

    #retrive all meta data
    am = picker.all_meta
    am.twitter_title            #=> "Example twitter title"
    tc.twitter_description      #=> "Example twitter description"
    tc.og_title            #=> "Example twitter title"
    tc.og_description      #=> "Example twitter description"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
