Kafka:


Data Providers/Producers -> Kafka Cluster -> Consumers

Kafka Clusters:
	- Brokers
		- Topics
			- Partitions

Topic:
	- Category/Feed
	- Partitioned
	- Immutable

Borker:
	- Logical seperation of partitions of topics.
	- Holds Topics

Producers:
	- These are the ones that generate data and send it to Kafka Cluster
	- When they publish the data they use something called a Partitioner and it's job is to figure out which partition for the topic that the producer is writing to is the current lead, and where that data is going to be written to, which broker that is.


Tunning Parameters to increase the Throughput:

Batching and compression.
Queuing limits.


Consumers:
	- Read data from topics
	- Organised into groups
	- Partitions divided among them.
	- Consumer Configuration:
		 - Group Id
		 - Session timeout (default 30 Sec)
		 - Heartbeat
		 - Autocommit (default 5 sec)

Creating Topics:
bin/kafka-topics.sh
--zookeeper zk_host:port/chroot
--create --topic my_topic_name
--partitions 20
--replication-factor 3
--config x=y

Adding Topics:
bin/kafka-topics.sh
--zookeeper zk_host:port/chroot
--alter --topic my_topic_name
--partitions <new amount of partitions>

Modifying Topic Configurations:
bin/kafka-topics.sh
--zookeeper zk_host:port/chroot
--alter --topic my_topic_name
--config <new config> (or) --delete-config x

Deleting a Topic:
Topic deletion is disabled by default, to enable
delete.topic.enable=true

Checking Consumer Position:
bin/kafka-run-class.sh kafka.tools.ConsumerOffsetChecker
--zookeeper localhost:2181
--group test

Configuring Consumer Groups:
bin/kafka-consumer-groups.sh
--bootstrap-server broker1:9092
--list (or) --describe --group test-consumer-group