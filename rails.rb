#!/usr/bin/env ruby

require 'gmail'
require 'highline/import'

def subscribe(group_subscribe, gmail, username, password)
  email = gmail.compose do
    to "#{group_subscribe}"
    cc "#{gmail.username}"
    subject "#{group_subscribe}"
  end
  return email.deliver!
end

username = ask("Please enter your gmail username: ") { |q| }
password = ask("Enter your gmail password: ") { |q| q.echo = "*" }
gmail = Gmail.connect(username, password)

subscribe("rubyonrails-talk+subscribe@googlegroups.com", gmail, username, password)
subscribe("rubyonrails-core+subscribe@googlegroups.com", gmail, username, password)
subscribe("rubyonrails-security+subscribe@googlegroups.com", gmail, username, password)

gmail.logout
