def gconftool(username)
  "xvfb-run -w 0 sudo -iu #{username} gconftool-2"
end

action :set do
  execute "set key" do
    command "#{gconftool(new_resource.username)} --set #{new_resource.name} #{new_resource.value} --type #{new_resource.type}"
  end
  new_resource.updated_by_last_action(true)
end

action :unset do
  execute "unset key" do
    command "#{gconftool(new_resource.username)} --unset #{new_resource.name}"
  end
  new_resource.updated_by_last_action(true)
end
