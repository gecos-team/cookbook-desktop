def gsettings
  "xvfb-run -w 0 gsettings"
end

action :set do
  execute "set key" do
    user    new_resource.username
    command "#{gsettings} set #{new_resource.schema} #{new_resource.name} #{new_resource.value}"
  end
  new_resource.updated_by_last_action(true)
end

action :unset do
  execute "unset key" do
    user    new_resource.username
    command "#{gsettings} reset #{new_resource.schema} #{new_resource.name}"
  end
  new_resource.updated_by_last_action(true)
end
