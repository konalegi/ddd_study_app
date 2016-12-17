class ProfileFabric
  class << self
    def init(name, surname, phone)
      profile = ProfileAggregate.new
      profile.instance_variable_set(:"@id", SecureRandom.uuid)
      profile.instance_variable_set(:"@name", name)
      profile.instance_variable_set(:"@surname", surname)
      profile.instance_variable_set(:"@phone", phone)
      profile.instance_variable_set(:"@cars", [])
      profile
    end
  end
end