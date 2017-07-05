# Metagame-API

Metagame-API is a Ruby on Rails API which adds gamification behavior to your project.
The API implements different gamification concepts like Points, Badges and Ranks.

## Prerequisites
You will need the following to be installed:

* Ruby language (2.3)
* Ruby on Rails (4.2.5).
* Bundler (http://bundler.io/)

## Installation

1. Clone this repo.
2. Move into the folder of this project and execute:

```
$ bundle install
```

4. Move to folder config/ and create a *application.yml* file following the example in application_example.yml.
Inside the file *application.yml* you have to specify your database configuration.

5. Finally, run the API executing:
```
$ rails server
```

The API will be running in port 3000. But you can change it, executing it with the -p (port param). E.g: "rails server -p 5000"

## Usage

All the endpoints are specified in the Wiki of this project.

## Testing

The API contains a folder inside spec/ which has unit tests.
To run all tests, move to the main folder of the project and execute:
```
$ rspec
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Credits

Created by Pravisani Santiago (http://www.github.com/sanatem)

Cientopolis @ Lifia
