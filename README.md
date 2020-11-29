# twilio_toy
Twilio API ruby toy project 

![temporary logo](https://bt-strike.s3-us-west-2.amazonaws.com/images/ruby.gif "twilio_toy temporary logo")

Uses https://www.twilio.com/
* Send SMS
* task_2

<!---
##![screen capture get_my_news](https://s2.gifyu.com/images/Peek-2018-10-28-18-13.gif "Screen Sample runing the script")
--->
Prerequisites:
* rvm (rvm.io)
* ruby interpreter (2.0+)
* required gems (see Gemfile)
* linux terminal
* twilio api Key (get one from https://www.twilioi.com)

Current State:
* ask and save api credentials locally if not found
* load api credentials if found locally
* initial states for requesting api calls

Modules and APIs involved in this project:
* twilio api
* api 2
* api 3

Features to add [coming soon...]
* add more sms features

Setup usage with rvm and process event series:
* create a gemset
`$ rvm gemset create <gemset>`
eg. `$ rvm gemset create twilio_toy`
* use created gemset
`$ rvm <ruby version>@<gemset>`
* install bundler gem
`$ gem install bundler`
* install necessary gems
`$ bundle`
* create directory api_keys
`$ mkdir api_keys`
* make script executable
`$ chmod +x twilio_ruby.rb`
* run script 
`$ ./twilio_ruby.rb`
