# Inspec profile to test the basic functionalty of the Java app

## Inspec default attributes are set in inspec.yml file
| Attribute             | Description                                                            | Default Value |
|-----------------------|------------------------------------------------------------------------|---------------|
| java_version       | Required Java version                                           | 1.8     |
| mysql_version           | Required MySQL version                           | 5.x           |
| app_port       | Port on which app is deployed                          | 9191           |
| app_path       | Web path of the app                           | SpringBootCRUDApp           |

## It tests
- Java and MySQL is installed with required version.
- App is running on the specified port.

## How to run application
- Make sure Java and Mysql is installed
- DB is created with user credentials.
- Run the app using command
java -jar -DPORT=9191 -DDB_NAME=demo -DDB_USER=root -DDB_PWD=root@123 sampleapplication-2.0.0.jar

where,
DB_NAME: database name.
DB_USER: database user.
DB_PWD: database password.
PORT: port on which app will be running.

## How to test app
- You can set InSpec attributes/inputs in any YAML file; and pass that YAML using --inout-file flag
- Run InSpec profile with default attributes
inspec exec basic_test
- Run InSpec profile by passing attributes from external YAML file.
inspec exec basic_test --input-file basic_test/files/test_inputs.yml
