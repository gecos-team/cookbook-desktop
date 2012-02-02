def load_current_resource
  { 'libglib2.0-bin' => 'gsettings',
    'xvfb'           => 'xvfb-run' }.each do |pkg,bin|
    package pkg do
      action :nothing
      not_if "which #{bin}"
    end.run_action(:install)
  end
end

action :set do
  execute "set key" do
    user    new_resource.user
    command "#{gsettings} set #{new_resource.schema} #{new_resource.name} #{new_resource.value}"
  end
  new_resource.updated_by_last_action(true)
end

action :unset do
  execute "unset key" do
    user    new_resource.user
    command "#{gsettings} reset #{new_resource.schema} #{new_resource.name}"
  end
  new_resource.updated_by_last_action(true)
end

def gsettings
  "xvfb-run -w 0 gsettings"
end
