# _Giggs_ [![Build Status](https://travis-ci.org/MozMorris/giggs.svg?branch=master)](https://travis-ci.org/MozMorris/giggs) [![Coverage Status](https://coveralls.io/repos/MozMorris/giggs/badge.png)](https://coveralls.io/r/MozMorris/giggs)

_Giggs combines [Create.js](http://createjs.org/) and Sinatra. It's a great starting point for building websites where the content can be edited in-line. No more "Edit - Preview - Publish"._

[Here's the demo.](http://giggs.herokuapp.com/) Sign in with ***test@user.com*** and ***password***

Giggs also comes with the tools you'd expect from a modern development workflow. Its [Grunt](http://gruntjs.com/) configuration follows that of the [generator-webapp](https://github.com/yeoman/generator-webapp) project. It's been slightly modified to work with servers like Pow & Unicorn.

## Project Setup

_How do I start working on the project?_

1. Copy the sample `.sample.env` and update it.  
`$ cp .sample.env .env`  

2. Install dependencies.  
`$ bundle install & npm install & bower install`  

3. Run the migrations and seed the db with some data.  
`$ rake db:migrate && rake db:seed`  

4. Compile and watch assets.  
`$ grunt serve`

5. Run your usual rack web server. This example uses the [Powder ](https://github.com/rodreegez/powder) gem to run [Pow](http://pow.cx/).
`$ powder link && powder up`

## Testing

_How do I run the project's automated tests?_

### Specs

`$ bundle exec rake`

<!--## Deploying

### _How to setup the deployment environment_

- _Required heroku addons, packages, or chef recipes._
- _Required environment variables or credentials not included in git._
- _Monitoring services and logging._

### _How to deploy_

## Troubleshooting & Useful Tools

_Examples of common tasks_

> e.g.
>
> - How to make curl requests while authenticated via oauth.
> - How to monitor background jobs.
> - How to run the app through a proxy.

## Contributing changes

- _Internal git workflow_
- _Pull request guidelines_
- _Tracker project_
- _Google group_
- _irc channel_
- _"Please open github issues"_

-->

## Credit

[Sinatra](https://github.com/sinatra/sinatra) you're awesome.  
[Create](https://github.com/bergie/create). Thank you [Henri](https://github.com/bergie)

## License

MIT © [Moz Morris](http://mozmorris.com)
