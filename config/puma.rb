# frozen_string_literal: true

max_threads_count = Integer(ENV.fetch('RAILS_MAX_THREADS', '5'), 10)
min_threads_count = Integer(
  ENV.fetch('RAILS_MIN_THREADS', ENV.fetch('RAILS_MAX_THREADS', '5')),
  10
)
threads min_threads_count, max_threads_count

port        Integer(ENV.fetch('PORT', '3000'), 10)
environment ENV.fetch('RAILS_ENV', 'development')

pidfile ENV.fetch('PIDFILE', 'tmp/pids/server.pid')

if ENV.fetch('RAILS_ENV', 'development') == 'development'
  workers 0
else
  workers Integer(ENV.fetch('WEB_CONCURRENCY', '2'), 10)
  preload_app!
end

plugin :tmp_restart
