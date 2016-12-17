# attrs = {
#   scheme: 'postgres',
#   user:   'dev',
#   password: '',
#   host: '',
#   port: 5432,
#   path: "rom_rb_sample_app_#{Rails.env}"
# }
# uri = Addressable::URI.new(attrs).to_s
#
# conf = ROM::Configuration.new(:sql, uri)
# conf.relation(:users)
# DB = ROM.container(conf)

# gateway = DB.gateways[:default]
# p ROM::SQL::Gateway.instance.migrator

# conf.default.connection.create_table(:users) do
#   primary_key :id
#   column :name, String
#   column :surname, String
#   column :phone, String
# end

# migration = gateway.migration do
#   change do
#     create_table :users do
#       primary_key :id
#       column :name, String
#       column :surname, String
#       column :phone, String
#     end
#   end
# end
#
# migration.apply(gateway.connection, :up)
#
#
#
# class UserRepo < ROM::Repository[:users]
#   commands :create, update: :by_pk
# end
#
# user_repo = UserRepo.new(DB)
# start_time = Time.now.to_f
#
# 10.times do
#   user = user_repo.create(name: 'Ramil', surname: 'Akhmentshin', phone: '+79061111718')
# end
# p ((Time.now.to_f - start_time) * 1000).round(2)