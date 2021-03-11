job "easytraveltest" {
  datacenters = ["dc1"]

  constraint {
    attribute = "${attr.kernel.name}"
    value = "linux"
  }

  update {
    stagger = "10s"
    max_parallel = 1
  }

##########################################################################################

  # - frontend #
  group "frontend" {
    count = 1
    network {
    port "http" {
      to = 8080
    }
    }
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }

    # - easytravel-frontend - #
    task "easytravel-frontend" {
      driver = "docker"

      config {
        image = "dynatrace/easytravel-frontend"
		ports = ["http"]
        port_map = {
          http = 8080
        }
      }

      service {
        name = "frontend"
        tags = ["frontend"]
        port = "http"
      }

      resources {
        cpu = 100 # 100 Mhz
        memory = 256 # 128MB
        
      }
    } 
  }
##########################################################################################

  # - mongodb #
  group "mongodb" {
    count = 1
    network {
    port "http" {
      to = 8080
    }
    }
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }

    # - easytravel-mongodb - #
    task "easytravel-mongodb" {
      driver = "docker"

      config {
        image = "dynatrace/easytravel-mongodb"
		ports = ["http"]
        port_map = {
          http = 27017
        }
      }

      service {
        name = "mongodb"
        tags = ["mongodb"]
        port = "http"
      }

      resources {
        cpu = 100 # 100 Mhz
        memory = 256 # 128MB
        
      }
    } 
  }
##########################################################################################

  # - nginx #
  group "nginx" {
    count = 1
    network {
    port "http" {
      to = 8080
    }
    }
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }

    # - easytravel-nginx - #
    task "easytravel-nginx" {
      driver = "docker"

      config {
        image = "dynatrace/easytravel-nginx"
		ports = ["http"]
        port_map = {
          http = 80
        }
      }

      service {
        name = "nginx"
        tags = ["nginx"]
        port = "http"
      }

      resources {
        cpu = 100 # 100 Mhz
        memory = 256 # 128MB
        
      }
    } 
  } 
##########################################################################################

  # - backend #
  group "backend" {
    count = 1
    network {
    port "http" {
      to = 8080
    }
    }
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }

    # - easytravel-backend - #
    task "easytravel-backend" {
      driver = "docker"

      config {
        image = "dynatrace/easytravel-backend"
		ports = ["http"]
        port_map = {
          http = 8091
        }
      }

      service {
        name = "backend"
        tags = ["backend"]
        port = "http"
      }

      resources {
        cpu = 100 # 100 Mhz
        memory = 256 # 128MB
        
      }
    } 
  }
##########################################################################################

  # - loadgen #
  group "loadgen" {
    count = 1
    network {
    port "http" {
      to = 8080
    }
    }
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }

    # - easytravel-loadgen - #
    task "easytravel-loadgen" {
      driver = "docker"

      config {
        image = "dynatrace/easytravel-loadgen"
		
      }

      
      resources {
        cpu = 100 # 100 Mhz
        memory = 256 # 128MB
        
      }
    } 
  } 

}
