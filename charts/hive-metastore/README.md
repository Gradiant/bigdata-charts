hive
====
The Apache Hive™ data warehouse software facilitates reading, writing, and managing large datasets residing in distributed storage using SQL. Structure can be projected onto data already in storage. A command line tool and JDBC driver are provided to connect users to Hive.

Current chart version is `0.1.0`

Source code can be found [here](https://github.com/gradiant/charts/charts/hive)

## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://kubernetes-charts.storage.googleapis.com | postgresql | ~8.6.0 |

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| conf.hiveSite.hive_metastore_uris | string | `"thrift://hive-metastore:9083"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"bde2020/hive"` |  |
| image.tag | string | `"2.3.2-postgresql-metastore"` |  |
| postgresql.initdbScriptsConfigMap | string | `"hive-metastore-postgresql-init"` |  |
| postgresql.postgresqlDatabase | string | `"metastore"` |  |
| postgresql.postgresqlPassword | string | `"hive"` |  |
| postgresql.postgresqlUsername | string | `"hive"` |  |
| resources | object | `{}` |  |
