Docker volume dumper
=====================

***Usage***  
```
docker run --rm mibexx/docker-dump <command>
```

***Commands***

| Command | Description |
| -------- | ----------- |
| dump | Dump the /data directory |
| restore | Restore dump to /data directory |


***Environments***  

| Variable | Description | Default |
| -------- | ----------- | ------- |
| ENGINE | Possible engine values: default, ssh, awss3 | default |
| PROJECT | Name of the Project | project |
| VERSION | Version of the Project | master |


Engine "ssh"
------------
```
docker run --rm -v ~/data:/data -e ENGINE=ssh mibexx/docker-dump <command>
```

***Environments***

| Variable | Description | Default |
| -------- | ----------- | ------- |
| SSHUSER | SSH User | root |
| SSHPORT | SSH Port | 22 |
| SSHHOST | SSH Host | 127.0.0.1 |
| SSHKEYFILE | Path to the ssh-keyfile | /root/.ssh/id_rsa |
| SSHPASS | SSH Password |  |
| DUMPNAME | Name of the dump-file for restoring | the latest file |

If no pass is given it will try to use the key file.


Engine "awss3"
------------
```
docker run --rm -v ~/data:/data -e ENGINE=ssh mibexx/docker-dump <command>
```

***Environments***

| Variable | Description | Default |
| -------- | ----------- | ------- |
| AWS_ACCESS_KEY_ID | AWS S3 Access ID |  |
| AWS_SECRET_ACCESS_KEY | AWS S3 Access Key |  |
| BUCKET | The s3 bucket url like s3://bucketname |  |
| DUMPNAME | Name of the dump-file for restoring | the latest file |

If no pass is given it will try to use the key file.