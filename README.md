# new-relic-kata-setup

Kataトレーニング環境をセットアップするスクリプト

## ステップ 1

UserDataに以下のスクリプトを入力してAmazon Linux2 のインスタンスを起動します。

``` sh:Userdata
#!/bin/bash  
  
curl -L https://raw.githubusercontent.com/qryuu/new-relic-kata-setup/master/userdata.sh | bash
```

と入力し起動します。  

## ステップ 2

以下のセキュリティｰグループを開放します。:

[Cloud9 のIPレンジ](https://docs.aws.amazon.com/ja_jp/cloud9/latest/user-guide/ip-ranges.html) からのSSHポート</br>
利用クライアントからのTCP 3000ポート</br>
利用クライアントからのSSHポート</br>

## ステップ 3

[SSH 環境 の作成](https://docs.aws.amazon.com/ja_jp/cloud9/latest/user-guide/create-environment-ssh.html) の手順1，2が完了した状態のEC2インスタンスが起動します。手順3以降の作業を行いCloud9環境を完成させます。

## ステップ 4

1.kata-download.sh、
2.kata-install.sh
3.kata-setup.sh
上記を順番に実行するとRuby-kataがセットアップされます。  
kata-start.sh を実行するとKata環境がスタートします。
