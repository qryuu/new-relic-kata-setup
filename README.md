# new-relic-kata-setup

Kataトレーニング環境をセットアップするスクリプト
Amazon Linux 2 EC2 Userdataに

``` #!/bin/bash  
  
curl -L https://raw.githubusercontent.com/qryuu/new-relic-kata-setup/master/userdata.sh | bash
```

と入力し起動します。  
起動したInstanceにCloud9を接続し、kata-download.sh、kata-install.sh、kata-setup.sh の順に実行します。
kata-start.shを実行するとKata環境がスタートします。
