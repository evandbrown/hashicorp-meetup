resource "google_sql_database_instance" "default" {
    region = "us-east1"
    database_version = "MYSQL_5_5"
    settings {
        tier = "D1"
        activation_policy = "ON_DEMAND"
        authorized_gae_applications = []
        pricing_plan = "PER_USE"
        replication_type = "SYNCHRONOUS"

        backup_configuration {
            binary_log_enabled = true
            enabled = true
            start_time = "18:00"
        }   

        ip_configuration {
            ipv4_enabled = true
            authorized_networks {
                name = "office_network"
                value = "1.2.3.4"
            }   
        }   

        location_preference {
            zone = "us-east1-b"
        } 
    }   
}   

resource "google_sql_database" "db-temp-test1" {
    name = "db-temp-test1"
    instance = "${google_sql_database_instance.default.name}"
}
