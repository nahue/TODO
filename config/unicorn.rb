worker_processes 1

APP_PATH = "/home/vagrant/deploy/TODO_staging/current"
working_directory APP_PATH # available in 0.94.0+

listen "/tmp/unicorn.todo.sock", :backlog => 64
#listen 8080, :tcp_nopush => true

timeout 30

pid APP_PATH + "/tmp/pids/unicorn.pid"

stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stderr.log"
