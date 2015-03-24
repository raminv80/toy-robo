# Toy::Robo

Welcome to my Toy robot test!

This application moves a robot on a table while keeping it safe! This gem is developed as a reply to Toy robot ruby test. 


## Usage

To run the app as a standalone application, clone the code to your local, browse to the folder and run 'bin/run' form shell (you need execusion priviledge to run the file or chmod 755).

```Batchfile
$ ./bin/run
```


##Available commands

The robot accepts following commands

- PLACE x, y, oriention
  - Acceptable values for oriention are NORTH, SOUTH, WEST, EAST
  - x and y must be digits and between 0 to 4
- MOVE
  moves robot one unit ahead
- LEFT
  turns robot 90 degree to left
- RIGHT
  turns robot 90 degree to right
- REPORT
  reports current position of robot

Te robot accepts commands from STDIN, executing valid commands one at a time until EOF is reached.  (On a Linux or OSX system, type C-d to generate an EOF character).

## Feeding a command file

To feed a file as input (for example ./examples/sample1.txt) run following line from the shell:

```Batchfile
$ cat ./examples/sample1.txt | ./bin/run
```

To experiment with the code, you may run `bin/console` for an interactive prompt.


## Installation as Gem

This is not intended to be used as a Gem but nothing stops you to include it as gem!

Add this line to your application's Gemfile:

```ruby
gem 'toy-robo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install toy-robo

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/toy-robo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
