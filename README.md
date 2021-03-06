Docker volume dumper
=====================

***Usage***  
```
docker run --rm mibexx/docker-dumper <command>
```

***Commands***

| Command | Description |
| -------- | ----------- |
| dump | Dump the $DATAPATH directory |
| restore | Restore dump to $DATAPATH directory |
| clear | (!) Remove all Data in $DATAPATH directory |


***Environments***  

| Variable | Description | Default |
| -------- | ----------- | ------- |
| ENGINE | Possible engine values: default, ssh, awss3 | default |
| PROJECT | Name of the Project | project |
| VERSION | Version of the Project | master |
| DATAPATH | Path to the data | /data |


Engine "ssh"
------------
```
docker run --rm -v ~/data:/data -e ENGINE=ssh mibexx/docker-dumper <command>
```

***Environments***

| Variable | Description | Default |
| -------- | ----------- | ------- |
| SSHUSER | SSH User | root |
| SSHPORT | SSH Port | 22 |
| SSHHOST | SSH Host | 127.0.0.1 |
| SSHKEYFILE | Path to the ssh-keyfile | /root/.ssh/id_rsa |
| SSHPASS | SSH Password |  |
| SSHDEST | Root Path on Server | ~/ |
| DUMPNAME | Name of the dump-file for restoring | the latest file |

If no pass is given it will try to use the key file. It's usefull to inject your key-file via volume into the container.


Engine "awss3"
------------
```
docker run --rm -v ~/data:/data -e AWS_ACCESS_KEY_ID=123 -e AWS_SECRET_ACCESS_KEY=abc -e BUCKET=s3://mybucket -e ENGINE=awss3 mibexx/docker-dumper <command>
```

***Environments***

| Variable | Description | Default |
| -------- | ----------- | ------- |
| AWS_ACCESS_KEY_ID | AWS S3 Access ID |  |
| AWS_SECRET_ACCESS_KEY | AWS S3 Access Key |  |
| BUCKET | The s3 bucket url like s3://bucketname |  |
| DUMPNAME | Name of the dump-file for restoring | the latest file |

Also it is possible to inject your local .aws/credentials as a volume to /root/.aws/credentials.