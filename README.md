# new-relic-kata-setup

Kataトレーニング環境をセットアップするスクリプト

## Amazon Linux2 Base Cloud9

### ステップ 1

Cloud9ConsoleからAmazon Linux2 Base のCloud9を起動します。

### ステップ 2

Cloud9 インスタンスのセキュリティーグループにTCP Port 3000 のインバウンドを許可します。

### ステップ 3

Cloud9 のbash コンソールでgit clone を実行して、リポジトリをコピーします。

``` sh:git clone
git clone https://github.com/qryuu/new-relic-kata-setup.git
```

### ステップ 4

Amazon_Linux2_base_Cloud9_setup.sh を開いて`Run`をクリックします。

### ステップ5

Kata-Setup-2/1.kata-download.sh  
Kata-Setup-2/2.kata-install.sh  
Kata-Setup-2/3.kata-setup.sh  

を順番に実行してNew Relic Kata 環境を自動的に構築します。

### ステップ6

kata-start.sh を開き`Run`をクリックするとKata アプリケーションが起動します。
`http://0.0.0.0:3000` をクリックして`Open`をクリックすれば、Kataアプリが表示されます。

## Old Cloud9

EC2 SSH Base Cloud9

### ステップ 1

UserDataに以下のスクリプトを入力してAmazon Linux2 のインスタンスを起動します。

``` sh:Userdata
#!/bin/bash  
  
curl -L https://raw.githubusercontent.com/qryuu/new-relic-kata-setup/master/userdata.sh | bash
```

と入力し起動します。  

### ステップ 2

以下のセキュリティｰグループを開放します。:

[Cloud9 のIPレンジ](https://docs.aws.amazon.com/ja_jp/cloud9/latest/user-guide/ip-ranges.html) からのSSHポート</br>
利用クライアントからのTCP 3000ポート</br>
利用クライアントからのSSHポート</br>

### ステップ 3

[SSH 環境 の作成](https://docs.aws.amazon.com/ja_jp/cloud9/latest/user-guide/create-environment-ssh.html) の手順1，2が完了した状態のEC2インスタンスが起動します。手順3以降の作業を行いCloud9環境を完成させます。

### ステップ 4

Kata-Setup/1.kata-download.sh  
Kata-Setup/2.kata-install.sh  
Kata-Setup/3.kata-setup.sh  
上記を順番に実行するとRuby-kataがセットアップされます。  
kata-start.sh を実行するとKata環境がスタートします。
