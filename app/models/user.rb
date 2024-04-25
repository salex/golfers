class User < ApplicationRecord
  has_secure_password

  belongs_to :group
  generates_token_for :password_reset, expires_in: 15.minutes do
   # Last 10 characters of password salt, which changes when password is updated:
   password_salt&.last(10)
  end

  normalizes :email, with: -> email { email.strip.downcase }
  validates_presence_of :email
  validates_uniqueness_of :username, :allow_blank => true
  validates_uniqueness_of :email, :case_sensitive => false

  validates_format_of :username, :with => /[-\w\._@]+/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  before_save :downcase_login
  serialize :permits, coder: JSON

  # ROLES = %w(super admin trustee member)

  def downcase_login
   self.email.downcase!
   # self.username.downcase!
  end

  def can?(meth,model)
    meth = meth.to_s.downcase
    model = model.to_s.downcase
    # puts "CRUD TEST #{meth} #{model}"
    return false if self.role.nil?
    # puts "CRUD ROLE #{meth} #{model} #{role}"
    return false unless [:create,:read,:update,:destroy].include?(meth.to_sym)
    # puts "CRUD METH #{meth} #{model} #{permits.keys} #{permits.keys.include?(model)}"
    # return false unless permits.keys.include?(model)
    permit = DefaultPermits.permit(self.role,model)
    # puts "CRUD PERMIT #{permit}"
    return false if permit == false 

    case meth 
    when 'create'
      return permit[0] == '1'
    when 'read' 
      return permit[1] == '1'
    when 'update' 
      return permit[2] == '1'
    when 'destroy' 
      return permit[3] == '1'
    end
    return false #crud boolean not '1'
    
  end

  # Role checker, from low of guest to high of super
  # MAY NOT NEED WITH can?
  def is_super?
    return has_role?(['super']) || self.username == 'salex'
  end

  def is_admin?
  return has_role?(%w(super admin))
  end

  def is_trustee?
  return has_role?(%w(trustee super admin))
  end

  def is_member?
  return has_role?(%w(member super admin trustee))
  end

  def is_guest?
    return has_role?(['guest'])
  end


  # MAY NOT NEED WITH can?
  def has_role?(role_arr)
    # new simpified role based access. role_arr is always an array
    # self.role should be a string with one word but will take more
    # will work with unserailized haml or json left in roles
    return false if self.role.blank?
    return false if role_arr.class != Array
    return role_arr.include?(self.role)
  end
  # scp -r /Users/salex/work/rails/users rails@167.71.240.205:/home/rails/apps/myusers

end
