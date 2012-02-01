action :set do
  execute "set key" do
    user    new_resource.username
    command "gconftool-2 --set #{new_resource.name} #{new_resource.value} --type #{new_resource.type}"
  end
  new_resource.updated_by_last_action(true)
end

action :unset do
  execute "unset key" do
    user    new_resource.username
    command "gconftool-2 --unset #{new_resource.name}"
  end
  new_resource.updated_by_last_action(true)
end
