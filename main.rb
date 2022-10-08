#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'optparse'
require 'json'

def alfred_output(title, subtitle, arg)
  {
    "title" => title,
    "subtitle" => subtitle,
    "arg" => arg,
    "icon" => 'icon.png'
  }
end

class UUID
  require 'securerandom'

  def self.uuid1
    require_relative 'uuidtools'
    UUIDTools::UUID.timestamp_create.to_s
  end

  def self.uuid4
    SecureRandom.uuid
  end

end

########################################################
# @!group Main: 脚本初始入口
########################################################

action_name = ARGV.nil? ? "nil" : ARGV[0]

uuid = UUID.send(action_name)

items = []
items << alfred_output(uuid, "downcase", uuid)
items << alfred_output(uuid.upcase, "upcase", uuid.upcase)

puts(JSON.generate({ "items" => items }))

