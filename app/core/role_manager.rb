module RoleManager
  READER = "reader"
  WRITER = "writer"
  ADMIN = "admin"
  SUPERADMIN = "super_admin"

  ROLES = [READER, WRITER, ADMIN, SUPERADMIN]

  def reader?
    index_of(role) >= index_of(READER)
  end

  def writer?
    index_of(role) >= index_of(WRITER)
  end

  def admin?
    index_of(role) >= index_of(ADMIN)
  end

  def super_admin?
    index_of(role) >= index_of(SUPERADMIN)
  end

  private

  def index_of(role)
    ROLES.index(role)
  end
end