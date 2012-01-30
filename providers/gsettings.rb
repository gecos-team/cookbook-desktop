def gsettings(username)
  "xvfb-run -w 0 sudo -iu #{username} gsettings"
end

action :set do
  execute "set key" do
    command "#{gsettings(new_resource.username)} set #{new_resource.schema} #{new_resource.name} #{new_resource.value}"
  end
  new_resource.updated_by_last_action(true)
end

action :unset do
  execute "unset key" do
    command "#{gsettings(new_resource.username)} reset #{new_resource.schema} #{new_resource.name}"
  end
  new_resource.updated_by_last_action(true)
end
