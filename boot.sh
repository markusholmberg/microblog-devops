#!/bin/sh
source venv/bin/activate
while true; do
    flask db upgrade
    if [[ "$?" == "0" ]]; then
        break
    fi
    echo Upgrade command failed, retrying in 5 secs...
    sleep 5
done
exec gunicorn -b :8000 --statsd-host=localhost:9125 --statsd-prefix=helloworld --access-logfile - --error-logfile - microblog:app
