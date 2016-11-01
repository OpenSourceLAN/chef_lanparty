
sudo_group = "admin"

default['respawn']['groups'] = [sudo_group, 'docker', 'comps']

default['respawn']['users'] = {
  "sirsquidness" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC++Kp1UgcFNGLGlxbtwFwNkXkbBxnEtL7P8fGs/lNSOcv7fTZzsbaUgKzgDgAxNPrxK0XKk44D0c//6DNyJSmMkSU31LZFQkrKqFMlS6duP4k0KgHumUyIZpy/vVNkwgH3o8qhJ0tTL6Z9MIlDgkzHWQyS8++8KNqP17336qtmoJikBj3+gVho3LKi9PRP/PzCJD/vx9omoV8fqY6T0K3byYJTb21TOckyAzNZVr8sTtSJtNZtrIWgfW0qrx4Hewt+q8djhKGmpcaE3VIcLawjoOx06++koKiESUBm4b3yhTZtQZ08bco1GfLWC7nFC2Jt1s/bOPGOnU6sp6Riqhl1 sirsquidness@squid",
    "groups" => [sudo_group, "docker"]
  },
  "tacticus" => {
    "key" => "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ+ggNbKjPXVggdJAgrtksBdZtYzxZWJ+hKAAQgo5GA7 kca@Kevins-MacBook-Pro.local",
    "groups" => [sudo_group, "docker"]
    },
  "bonbon" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQjMPJsLqIv8AyzdrqaHTn2p+lElo0ti+YjB/mdTroKvDK4lF7YbsdI5Vy/YTUI5LXy+kigpUDkRXmg2MuP2pOBGxPJbVy02MIrBxVN52qVwpzdnyPwUALss0bE+BTCoCD//PeyaCvw6S2a5UNS9rQCqnnyrLwyyovRMiHxdEKmuG6o58mCBxaVA05Btjo21EeA0ovwj4vmVny7IIuXyIqpM2E1Vp49VL+2B2v6pgGbOxcj58+TbPRdkzX1pxjFxRMbLxPZBdqU0TXtlkypxPh8jx0JpMeiKYRGBxV5E7t51QEM9wa7RpTEBSXympNwRZHpnsinlWl6FeF2a2QV9R5 danielsalamy@me.com",
    "groups" => [sudo_group, "docker"]
  },
  "priorax" => {
    "key" => "",
    "groups" => [sudo_group, "docker"]
  },
  "fishy" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAm5G3XtBhgRjPldRmetcj+pAG1FRg/Z70orGQWYbKXme3L1hhtum6BoYSnUbf3WTaYqQfj95Es+27A89J+WwjUK9Ustnf6OAasS1q1qzkIzXWDJ+Om+wQaOop9vLVdyzERvNZsT8DVj7DXbnHcDZgh8bt+g9cYDugrp3LmutkPFX53cKBNZxl3xrr7ZD0Xhj0BN2cfZK/0MS5R/4fZwck+q6GpmjlJUXwFgDAMXEPfi4c9Tk5qAtPn1tJE+aJcqRnoFltK3IPiHlm7AnhqE1FEhOSbwiAYl6wy8ZJ5yj5ITFeBl05agZKNLNIaO6QHY6vRXbEcfFmKcULZ6sqQJkUSw== rsa-key-20161018",
    "groups" => ['comps', "docker"]
  },
  "shadowreaper" => {
    "key" => "",
    "groups" => ['comps', "docker"]
  },
  "zardoz" => {
    "key" => "",
    "groups" => [sudo_group, "docker"]
  },
  "kelso" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCs+kibpkwP3ow5LRY33bFhuxOs22CPYDi5TY7I+8veMBAPxy2bNKdZMgvrfPOVJ1nS4U6ggKhdkDaCJBZ0m/d093GtVW2iX/t8YU6GMfwyHst6KIoAcMQrsupUeLXHQX6Vj1QiRSMpWTfOQO0CKK/KH/nnf4Jz2/2gPADNe1tHghBV4hXd71I1ur6LFqRAktFy9OdsAMFUE4kmPkkb1LchALX8ldpWmtdfljwAg0Z2t1W8V+6cl4Fq3Mz6YeQ9SRD76mwFTLxhLxbrdU3z8z9zKKpES3zQKyzpGJzt1dJqz+yEG+OhMHF+v98q/wrlKk6NwAnk3sfgbAuRdgvx5r1t Kelso@Discordia",
    "groups" => [sudo_group, "docker"]
  }

}
