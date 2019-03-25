#!/usr/bin/env ruby
require 'json'
require 'addressable'
require 'rest-client'
require 'byebug'
require 'twilio-ruby'
require 'yaml'
#require File.expand_path('get_ip_info.rb')
# ----------------------------------------------------------------------------
class TwilioSms

  def start
    puts '[twilio_api] TWILIO SMS'
    puts '[twilio_api] ENTER YOU APIKEY'
    api_auth = ask_or_load_twilio_api_auth
    puts '[twilio_api] ENTER YOUR TWILIO NUMBER'
    from = gets.chomp
    puts '[twilio_api] ENTER NUMBER TO SEND TO'
    to = gets.chomp
    puts '[twilio api] ENTER MESSAGE TO SEND'
    message = gets.chomp
    send_sms(api_auth,to,from,message)
  end

  def send_sms(api_auth,to,from,message)
    account_sid = api_auth.split("+").first
    auth_token = api_auth.split("+").last
    client = Twilio::REST::Client.new(account_sid, 
                                      auth_token)
    client.messages.create(from: from,
                           to: to,
                           body: message)
  end

  def ask_or_load_twilio_api_auth
    if local_twilio_api_auth?
      YAML.load_file('api_keys/twilio_api_auth.yml')
    else
      puts '[twilio-api] ENTER YOUR TWILIO ACCOUNT SID'
      api_id = gets.chomp
      puts '[twilio-api] ENTER YOUR TWILIO AUTH TOKEN'
      api_token = gets.chomp
      api_auth = "#{api_id}+#{api_token}"
      byebug
      save_twilio_api_auth(api_auth)
      api_auth
    end
  end

  def local_twilio_api_auth?
    if File.exist?('api_keys/twilio_api_auth.yml')
      true
    else
      false
    end
  end

  def save_twilio_api_auth(api_auth)
    file = File.new('api_keys/twilio_api_auth.yml', 'w')
    file.write(api_auth.to_yaml)
    file.close
  end

twilio_obj = TwilioSms.new
twilio_obj.start
