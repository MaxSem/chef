name "wiki-new"
description "Role applied to all wiki servers"

default_attributes(
  :accounts => {
    :users => {
      :wiki => { :status => :role }
    }
  },
  :exim => {
    :trusted_users => [ "www-data" ],
    :aliases => {
      :root => "grant"
    }
  },
  :memcached => {
    :memory_limit => 512,
    :connection_limit => 8192,
    :chunk_growth_factor => 1.05,
    :min_item_size => 5
  },
  :apache => {
    :mpm => "prefork",
    :timeout => 30,
    :event => {
      :server_limit => 32,
      :max_clients => 800,
      :threads_per_child => 50,
      :max_requests_per_child => 10000
    }
  }
)

run_list(
  "recipe[mediawiki-new::wiki]"
)