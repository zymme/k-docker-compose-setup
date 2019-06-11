#!/bin/sh

# Create Default RabbitMQ setup
( sleep 12 ; \

rabbitmqadmin declare exchange name=myLocalEx1 type=direct

rabbitmqadmin declare queue name=myLocalQ1 durable=true

rabbitmqadmin declare binding source="myLocalEx1" destination_type="queue" destination="myLocalQ1" routing_key="Q1"

rabbitmqadmin declare queue name=myLocalQ2 durable=true

rabbitmqadmin declare binding source="myLocalEx1" destination_type="queue" destination="myLocalQ2" routing_key="Q2"

# Create user
rabbitmqctl add_user test test


# Set user rights
rabbitmqctl set_user_tags test administrator


# Create vhosts
# rabbitmqctl add_vhost <vhostname>


# Set vhost permissions
# rabbitmqctl set_permissions -p <vhostname> <username> ".*" ".*" ".*"
rabbitmqctl set_permissions -p / test ".*" ".*" ".*"


) &
rabbitmq-server $@
