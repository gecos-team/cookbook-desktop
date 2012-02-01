def load_current_resource
  package 'gconf2' do
    action :nothing
    not_if "which gconftool-2"
  end.run_action(:install)
end

action :set do
  execute "set key" do
    user    new_resource.user
    command "gconftool-2 --set #{new_resource.name} #{new_resource.value} --type #{new_resource.type}"
  end
  new_resource.updated_by_last_action(true)
end

action :unset do
  execute "unset key" do
    user    new_resource.user
    command "gconftool-2 --unset #{new_resource.name}"
  end
  new_resource.updated_by_last_action(true)
end
