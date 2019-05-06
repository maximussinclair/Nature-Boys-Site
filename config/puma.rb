RailsRoot      = Dir.pwd
BindPort       = (ENV['PORT'] || '3000').to_i
Production     = if ENV['RAILS_ENV'] == 'production' then true else false end
Staging        = if ENV['RAILS_ENV'] == 'staging' then true else false end

Workers        = (ENV['WEB_CONCURRENCY'] || '3').to_i
Threads        = (ENV['THREADS'] || '5').to_i
WorkerMaxMem   = (ENV['WORKER_MAX_MEM'] || '512').to_i
SystemMem      = (ENV['SYSTEM_MEM'] || '1024').to_i

DaemonPriority = (ENV['DAEMON_PRIORITY'] || '-5').to_i

environment ENV.fetch("RAILS_ENV") { "development" }

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

directory       RailsRoot
if Production || Staging
  bind            "unix://#{shared_dir}/run/puma.sock"
else
  port            BindPort
  bind            "tcp://0.0.0.0:#{BindPort}"
  worker_timeout  1000
end

# Logging
stdout_redirect "#{shared_dir}/log/puma-nature.stdout.log", "#{shared_dir}/log/puma-nature.stderr.log", true if Production || Staging

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"

workers Workers
threads 1,Threads

preload_app!

before_fork do
  begin
    require 'puma_worker_killer'
    PumaWorkerKiller.config do |config|
      config.ram           = SystemMem # mb
      config.frequency     = 20   # seconds
      config.percent_usage = 0.95
      config.rolling_restart_frequency = 12 * 3600 # 12 hours
      config.reaper_status_logs = false
    end
    PumaWorkerKiller.start
  rescue LoadError
    puts "Can't start puma in cluster mode. Check puma worker killer"
  end
end

plugin :tmp_restart
