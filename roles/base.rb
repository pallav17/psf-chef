name "base"
description "Base recipes for all nodes"
run_list [
  "recipe[chef-client::cron]",
  "recipe[chef-client::delete_validation]",
  "recipe[user::data_bag]",
  "recipe[psf-misc::sudo]",
  "recipe[psf-misc::backup]",
  "recipe[psf-misc::ntp]",
  "recipe[psf-misc::ack]",
  "recipe[ntp]",
  "recipe[motd-tail]",
  "recipe[zsh]",
]
override_attributes({
  :authorization => {
    :sudo => {
      :include_sudoers_d => true,
    },
  },
  :chef_client => {
    :cron => {
      :minute => "*/30",
      :hour => "*",
    }
  },
  :ntp => {
    :servers => ["time.osuosl.org"],
  },
  :rsnapshot => {
    :client => {
      :server_role => "rsnapshot",
    },
  },
  :user => {
    :ssh_keygen => false,
  },
})
