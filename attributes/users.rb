
sudo_group = "admin"

default['respawn']['groups'] = [sudo_group, 'docker', 'comps']

default['respawn']['users'] = {
  "sirsquidness" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC++Kp1UgcFNGLGlxbtwFwNkXkbBxnEtL7P8fGs/lNSOcv7fTZzsbaUgKzgDgAxNPrxK0XKk44D0c//6DNyJSmMkSU31LZFQkrKqFMlS6duP4k0KgHumUyIZpy/vVNkwgH3o8qhJ0tTL6Z9MIlDgkzHWQyS8++8KNqP17336qtmoJikBj3+gVho3LKi9PRP/PzCJD/vx9omoV8fqY6T0K3byYJTb21TOckyAzNZVr8sTtSJtNZtrIWgfW0qrx4Hewt+q8djhKGmpcaE3VIcLawjoOx06++koKiESUBm4b3yhTZtQZ08bco1GfLWC7nFC2Jt1s/bOPGOnU6sp6Riqhl1 sirsquidness@squid
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAhQDS1fFFxxYS6kALEsH8TsGDWw/RVSHkGuzhSNPmC0onc7QmzxUSxlIUc4+K+H4snjsgHCNGIy8jaX+9cwPcPHVgTtnBMNlWNm51lFYk2L+aoyiaI2UtR8H8EzKVzs7Md8pYg2wTA9NH3+7aLEHjRa5qNdYyfxcAW1lhHxHwquBdgMd7ZFc= sirsquidness
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAo+b6Y4l3ff4HA/rP7A0Kp3VcwR7jwm0pcP5iCHtMd/2TY15DB4jAPToMjBVvK85vEa7KEfrA7n6G1KsDWDDtoJoe/ytwLvbqISXABJwLsCVypt303dtr9oFQgA1KW4IYpirgOWKGDIB+2JuYJ8rBT60FlSIo4RjPhWU88t30fLk= rsa-key-20090713
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1NCnYRAbDcldOaGX2CublpKaYcMNPpH5Ex5TCT0dYjVmSnOhlZ5F7cB3dSA3LmGb+KEtFU9voW052cqwISQOWRq0aL91q6mWWII8DhDpG/Ff983PDePgb7+0RdXKxE0YdTXuy/h/i3Tih93EsWJFkYfhXuzVdqCWgNi8OFmOjt1tTkSrjqlMSh6MLCTExbN391w7JgNEDs6Nnk0JXoJkkF2CkNy+uYBijOXkNcmQ8vZ81Yk7Nchib5RaA3vZdgE6XW3LRcEJNV8pYWmWK4T2/G6UIZjVT6o+i43hM3VQj5bkLQCdqDQu2Htrx0TZC/5OT1Q3cM+PrOwtszajtHuNozykMYcqs7HbPJbZUlWtmgcxOtv48WUYyPZFFgpiGYDK5p9uS5NNjBmIb95D9/a8HP8MdC4jbIUJ6Dn/r6DAx51t++oFp5eB9FIvObOoB/C9JyZ8mPktvI7L1nbpwsPW57jxO8BBgvRdC/UaBv0VsqMl633cK7F4dKEyziyiRC1nJxiJu4e6jCYIbFAwijXp54MfY2NMyTc3a7AtVreFtQHkIpXC9aTFTLhYqw/E3+jvi5eabNKJML27h5igfIDS38/FLEWe9Kl6Xkb3vsAZX359V7dVAWDfOBFq4/3sDZdNaFSQHBbmxaA3kdK5gcvxT+aq7Dl/LWzivuk4o58mXxQ== sirsquidness@squid-lappy
",
    "groups" => [sudo_group, "docker"],
    "enabled" => true
  },
  "tacticus" => {
    "key" => "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ+ggNbKjPXVggdJAgrtksBdZtYzxZWJ+hKAAQgo5GA7 kca@Kevins-MacBook-Pro.local",
    "groups" => [sudo_group, "docker"],
    "enabled" => true
    },
  "bonbon" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQjMPJsLqIv8AyzdrqaHTn2p+lElo0ti+YjB/mdTroKvDK4lF7YbsdI5Vy/YTUI5LXy+kigpUDkRXmg2MuP2pOBGxPJbVy02MIrBxVN52qVwpzdnyPwUALss0bE+BTCoCD//PeyaCvw6S2a5UNS9rQCqnnyrLwyyovRMiHxdEKmuG6o58mCBxaVA05Btjo21EeA0ovwj4vmVny7IIuXyIqpM2E1Vp49VL+2B2v6pgGbOxcj58+TbPRdkzX1pxjFxRMbLxPZBdqU0TXtlkypxPh8jx0JpMeiKYRGBxV5E7t51QEM9wa7RpTEBSXympNwRZHpnsinlWl6FeF2a2QV9R5 danielsalamy@me.com",
    "groups" => [sudo_group, "docker"],
    "enabled" => true
  },
  "priorax" => {
    "key" => "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIeRzcatQmkFvmvSj6sNGvao7v4GXdvvAPGdQqFsuFw0rUqLWuLE7zC9tBQSSQeBL4fKm0kT/YXmoIYuJ6VMD1Y= priorax@minipete",
    "groups" => [sudo_group, "docker"],
    "enabled" => true
  },
  "fishy" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAm5G3XtBhgRjPldRmetcj+pAG1FRg/Z70orGQWYbKXme3L1hhtum6BoYSnUbf3WTaYqQfj95Es+27A89J+WwjUK9Ustnf6OAasS1q1qzkIzXWDJ+Om+wQaOop9vLVdyzERvNZsT8DVj7DXbnHcDZgh8bt+g9cYDugrp3LmutkPFX53cKBNZxl3xrr7ZD0Xhj0BN2cfZK/0MS5R/4fZwck+q6GpmjlJUXwFgDAMXEPfi4c9Tk5qAtPn1tJE+aJcqRnoFltK3IPiHlm7AnhqE1FEhOSbwiAYl6wy8ZJ5yj5ITFeBl05agZKNLNIaO6QHY6vRXbEcfFmKcULZ6sqQJkUSw== rsa-key-20161018",
    "groups" => ['comps', "docker"],
    "enabled" => true
  },
  "shadowreaper" => {
    "key" => "",
    "groups" => ['comps', "docker"],
    "enabled" => false
  },
  "zardoz" => {
    "key" => "",
    "groups" => [],
    "enabled" => false
  },
  "kelso" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCs+kibpkwP3ow5LRY33bFhuxOs22CPYDi5TY7I+8veMBAPxy2bNKdZMgvrfPOVJ1nS4U6ggKhdkDaCJBZ0m/d093GtVW2iX/t8YU6GMfwyHst6KIoAcMQrsupUeLXHQX6Vj1QiRSMpWTfOQO0CKK/KH/nnf4Jz2/2gPADNe1tHghBV4hXd71I1ur6LFqRAktFy9OdsAMFUE4kmPkkb1LchALX8ldpWmtdfljwAg0Z2t1W8V+6cl4Fq3Mz6YeQ9SRD76mwFTLxhLxbrdU3z8z9zKKpES3zQKyzpGJzt1dJqz+yEG+OhMHF+v98q/wrlKk6NwAnk3sfgbAuRdgvx5r1t Kelso@Discordia",
    "groups" => [sudo_group, "docker"],
    "enabled" => false
  },
  "shorty" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCf/wtOjkm246Lzcuw/Rgp5iVBZyh96SinYdZgZYPUfVDSif720kKa/KgzMWbXIiP9M60JyiEBFFEOwfbkFlhc4Zgg4Ha4kExWp0ozde74ZC61/n4ubyXDi0h3M4366efmeIREAOWq79VLoOKxZS43JDDbUAgErm2nujuuzByJVFJfsAs/Kh/4LBVFG/U02LUU910aHMLe9FlTmCllFmz7Xh0crcw3KX2JQ9B9XGbHc3EA+t7zeM4fAd+MX3HpfAyrqATzrOXmm2H7XdxatTZLDtGqFm8QH/TdR5EsF6jSpqmOB2ZAnP7m3X0GkpxjV9SfxpJumObxSf/XfkX1kbGEJ shanes@Shanes-MacBook-Pro.local",
    "groups" => [sudo_group, "docker"],
    "enabled" => true
  },
  "tardoe" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoKM24GWZg5x4aY+Iz1lHp3NoW5S43mnibpJIwjSpkBfr/t9fgIBsTd7mWdvI5iV2p9rgPW/dbOtoyQZOqtg2V35xNkawxkH77/33fg1EtpuHDpoxU3jEYyLeDcXxnIptyt+RgoUPJnm0/yerpSk69av6HbidPY6nDAowdF04sX7dy/9JN7GsJYSTQAbUJ+o9Eeh/s6o6tk5d66RSI9QrtSlO5neKBS16z/5EveU4aJCNl+2yeV0D+hR61Al0bGf81K6E2mweXufXiq+ZcLwcZR+6jbY+teI/JRfGFxKP5mZiFg4CzfHKbiXYKygVqaiInIFVYbqWYhX0nnkGmSRKd timraphael@MacBook-Pro.local",
    "groups" => [sudo_group, "docker"],
    "enabled" => true
  },
  "hewi" => {
    "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMq05lCNiPnb0dcyEZKzl918iv9uP5VUTjf61LMhcZXrzJJNpxUrsCwg6Wx1U7yz9KxCm0Hi9rwZLweB0Fsk2z/ZkpXSLTJHkaC+kx7KB3sca/r5JhMNKd6bdhH1If86PyRNzJ6siGQIfvpTEalzzHlq+jUO2WyzNbDk2WONIA7In8yEQ008TO4lGp3gJrBudWiK/OOjz0cNDpyAHzlRK/GKiVLL5S7e3o9x/+z2+ZZTFtW0rgR8AxwwNs/oqjkZfGacGRLiNf7ZwEP2dPSpDPX7RHMOKO1XnOYlaj+ZcxqzHJq4YWjosCwhuTcRoocVIZIqhTlApOVHIshKSeuLml dhartley@vixtro@VX-SB-DH",
    "groups" => [sudo_group, "docker"],
    "enabled" => true
  }

}
