# Thinreports::Preview

Thinreports::Preview ia Thinporets Preview Library

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thinreports-preview', git: "https://github.com/naoto/thnreports-preview.git"
```

And then execute:

    $ bundle

## Usage

Options

- `-t`,`--target` is thinreports template. default `./template/`
- `-o`,`--output` is pdf output directory. default `./generate` 
- `-l`,`--list_loop` is List Loop Count. default `1`

Execute

```shell
$ bundle exec ruby bin/thinreports-preview -t /path/to/file.tlf -o /output/direcitory
```

Library

```ruby
require 'thnrepornts/preview'

Thinreports::Preview::Generater.new('/path/to/file.tlf').generate('/output/directory')
```
