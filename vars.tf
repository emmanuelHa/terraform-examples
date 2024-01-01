variable "region" {
  type = string
  default = "eu-west-1"
  description = "La region ou seront créés les resources"
}

variable "port" {
  type = number
  default = 8080
}

variable "is_public" {
  type = bool
  default = true
}

variable "names" {
  type = list
  default = ["server-1", "server-2", "server-3"]
}

variable "server" {
  type = map
  default = {
    "name" = "My Server"
    "instance_type" = "t3.micro"
  }
}

variable "instance_types" {
  type = list
  default = ["t3.nano", "t3.micro", "t3.nano"]
}

variable "servers_names" {
  type = list
  default = ["Server 1", "Server 2", "Server 3"]
}

variable "mount_paths" {
  type = list
  default = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd"]
}

variable "servers_dev" {
  type = map
  default = {
    "Server 1" = false,
    "Server 2" = true,
    "Server 3" = true
  }
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}