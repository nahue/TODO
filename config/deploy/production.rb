set :stage, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{deploy@33.33.33.33}
role :web, %w{deploy@33.33.33.33}
role :db,  %w{deploy@33.33.33.33}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '33.33.33.33', user: 'deploy', roles: %w{web app}, my_property: :my_value
