#!/usr/bin/env ruby

require 'gmail'
require 'highline/import'

def subscribe(list_controller, fullname, gmail, username, password)
  email = gmail.compose do
    to "#{list_controller}"
    cc "#{gmail.username}"
    subject "subscribe #{list_controller}"
    body "subscribe #{fullname}"
  end
  return email.deliver!
end

fullname = ask("Hello, what is your full name? ") { |q| q.default = "Firstname Lastname" }
username = ask("Please enter your gmail username: ") { |q| }
password = ask("Enter your gmail password: ") { |q| q.echo = "*" }
gmail = Gmail.connect(username, password)

subscribe("ruby-talk-ctl@ruby-lang.org", fullname, gmail, username, password)
subscribe("ruby-core-ctl@ruby-lang.org", fullname, gmail, username, password)
subscribe("ruby-doc-ctl@ruby-lang.org", fullname, gmail, username, password)

gmail.logout
