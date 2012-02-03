Description
===========

LWRP to manage desktop's settings for an user.

There are a lot of user's settings that are managed by a desktop setting system
as **gconf**, **gsetting** and so. This LWRP let you manage the keys and values
for those settings.

Right now it's just supported **gconf** and **gsettings**, but I hope that more
desktop settings systems be supported in the future. For example, the one
used by _KDE_.

This LWRP born as a need for a project called [GECOS](http://forja.guadalinex.org/plugins/mediawiki/index.php?group_id=105) which is being developed
by the **Junta de Andalucía**, a local government from the lovely region of Spain:
Andalusia.


Requirements
============

In order to use this LWRP from your cookbook or recipe you need to add
this cookbook as a dependency at the `metadata.rb` file.

After doing that you can do things like:

```ruby
node['my_cookbook']['users'].each do |username|
  desktop_settings "picture-uri" do
    schema   "org.gnome.desktop.background"
    type     "string"
    value    "/usr/share/background/supecoolbackgroung.jpg"
    user     username
  end
end
```


Usage
=====

To see how this works and how could be used from another cookbook, let's see
some examples.

The LWRP provider by default is `gsettings` as this is the new kid on the block
and the current default system for GNOME and GNOME apps.
If you like to set a specific background to an user you could do something like:

Let's say we have a recipe named `background` with this at the `attributes.rb`:

```ruby
defaults['background']['image'] = '/usr/share/background/supecoolbackgroung.jpg'
defaults['background']['user']  = 'joe'
```

And this inside the recipe:

```ruby
desktop_settings "picture-uri" do
  schema   "org.gnome.desktop.background"
  type     "string"
  value    node['background']['image']
  user     node['background']['user']
end
```

But we can use also the `gconf` provider to set the _background_ is this is
the setting system that use our desktop:

```ruby
desktop_settings '/desktop/gnome/background/picture_filename' do
  type     'string'
  value    node['background']['image']
  user     node['background']['user']
  provider 'desktop_gconf'
end
```


License and Author
==================

Authors:

* Roberto C. Morano <rcmorano@emergya.com>
* Juanje Ojeda <juanje.ojeda@gmail.com>

Copyright 2011-2012 Junta de Andalucía  
Copyright 2012 Juanje Ojeda <juanje.ojeda@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

