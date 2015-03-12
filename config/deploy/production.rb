set :stage, :production

set :deploy_to, '~/apps/four-athens-members'

set :branch, 'master'

set :rails_env, 'production'

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{deploy@ec2-54-172-125-248.compute-1.amazonaws.com}
role :web, %w{deploy@ec2-54-172-125-248.compute-1.amazonaws.com}
role :db,  %w{deploy@ec2-54-172-125-248.compute-1.amazonaws.com}