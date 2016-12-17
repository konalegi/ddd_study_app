class ProfileRepository < ROM::Repository[:profiles]
  commands :create, delete: :by_pk, update: :by_pk

  def create_profile(profile)
    create(id: profile.id, payload: Oj.dump(profile))
  end

  def save_profile(profile)
    update(profile.id, payload: Oj.dump(profile))
  end

  def by_id(id)
    item = profiles.where(id: id).one
    return if item.nil?
    Oj.load(item.payload)
  end

end