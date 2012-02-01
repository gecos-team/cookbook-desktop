actions :set, :unset

attribute :name, :kind_of => String, :name_attribute => true, :required => true
attribute :user, :kind_of => String, :required => true
attribute :value, :kind_of => String, :required => true
attribute :schema, :kind_of => String
attribute :type, :kind_of => String

def initialize(*args)
  super
  @action = :set
  @provider = Chef::Provider::DesktopGsettings unless :schema.nil?
end

