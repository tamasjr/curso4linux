class docker {
        case $osfamily{
                "redhat":{
                        $pacotes = ['yum-utils','device-mapper-persistent-data','lvm2']
                }
                "debian":{
                        exec{"atualizando_pacotes":
                                command => "/usr/https://docs.docker.com/install/bin/apt update";
                        }
                        $pacotes = ['apt-transport-https','ca-certificates','curl','gnupg-agent','software-properties-common']
                        exec{"atualizando_pacotes":
                                command => "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -";
                        }
                }
        }

        package{$pacotes:
                ensure => present
        }

}

