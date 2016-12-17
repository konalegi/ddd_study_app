## setup rom
require 'rom-sql'
attrs = {
  scheme: 'postgres',
  user:   'dev',
  password: '',
  host: '',
  port: 5432,
  path: "rom_rb_sample_app_#{Rails.env}"
}

uri = Addressable::URI.new(attrs).to_s

conf = ROM::Configuration.new(:sql, uri)
conf.auto_registration("#{Rails.root}/app")

DB = ROM.container(conf)
