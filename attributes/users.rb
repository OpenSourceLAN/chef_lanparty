
sudo_group = "admin"

default['respawn']['groups'] = [sudo_group, 'docker']

default['respawn']['users'] = {
  "sirsquidness" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC++Kp1UgcFNGLGlxbtwFwNkXkbBxnEtL7P8fGs/lNSOcv7fTZzsbaUgKzgDgAxNPrxK0XKk44D0c//6DNyJSmMkSU31LZFQkrKqFMlS6duP4k0KgHumUyIZpy/vVNkwgH3o8qhJ0tTL6Z9MIlDgkzHWQyS8++8KNqP17336qtmoJikBj3+gVho3LKi9PRP/PzCJD/vx9omoV8fqY6T0K3byYJTb21TOckyAzNZVr8sTtSJtNZtrIWgfW0qrx4Hewt+q8djhKGmpcaE3VIcLawjoOx06++koKiESUBm4b3yhTZtQZ08bco1GfLWC7nFC2Jt1s/bOPGOnU6sp6Riqhl1 sirsquidness@squid",
    "groups" => [sudo_group, "docker"]
  },
  "tacticus" => {
  	"key" => "",
    "groups" => [sudo_group, "docker"]
    },
  "bonbon" => {
  	"key" => "",
    "groups" => [sudo_group, "docker"]
  },
  "priorax" => {
  	"key" => "",
  	"groups" => [sudo_group, "docker"]
  },
  "fishy" => {
  	"key" => ": ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAm5G3XtBhgRjPldRmetcj+pAG1FRg/Z70orGQWYbKXme3L1hhtum6BoYSnUbf3WTaYqQfj95Es+27A89J+WwjUK9Ustnf6OAasS1q1qzkIzXWDJ+Om+wQaOop9vLVdyzERvNZsT8DVj7DXbnHcDZgh8bt+g9cYDugrp3LmutkPFX53cKBNZxl3xrr7ZD0Xhj0BN2cfZK/0MS5R/4fZwck+q6GpmjlJUXwFgDAMXEPfi4c9Tk5qAtPn1tJE+aJcqRnoFltK3IPiHlm7AnhqE1FEhOSbwiAYl6wy8ZJ5yj5ITFeBl05agZKNLNIaO6QHY6vRXbEcfFmKcULZ6sqQJkUSw== rsa-key-20161018",
  	"groups" [sudo_group, "docker"]
  }

}
