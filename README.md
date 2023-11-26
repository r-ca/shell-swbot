# shell-swbot(WIP)

## デモ
![output_15fps](https://github.com/r-ca/shell-swbot/assets/66072112/2e8a6d78-72ad-44e9-91fe-f89adfef2784)

## 概要
- SwitchBotのAPIを叩いてデバイスを操作するシェルスクリプト(Ulauncherから呼び出すのを想定)

## 詳細
### 環境変数
- `TOKEN`: SwitchBot APIのトークン
- `DEVICE_IDS`: 操作する対象のデバイス数, デバイスID(コンマ区切り)
- `ACTION`: 呼び出すアクション
  - `setOn`: トグル型デバイスをオンにする
  - `setOff`: トグル型デバイスをオフにする

### 使いかた
1. すべて環境変数で呼び出す場合:
   1. `TOKEN`, `DEVICE_IDS`, `ACTION`を環境変数に設定する
   2. `entry.sh`を呼び出す

2. アクション以外を固定で呼び出す場合:
   1. `TOKEN`, `DEVICE_ID_LIST`, `ACTION`(デフォルト動作)を`driver.sh`に設定する
   2. `driver.sh`の引数に`ACTION`を渡して呼び出す

## 呼び出し例

- 2個の照明を同時にオンにする (すべてを環境変数で指定)
```
TOKEN="TOKEN="0acc082716944f3a421fcc9c17c968ccc1ce52589d61d7d8d87d334bbe25e43888a919210d095190b4be941263a1ae97" \
DEVICE_IDS="2,01-202207310613-00000001,01-202207310613-00000002" \
ACTION="setOn" \
./entry.sh
```
- 1個の照明をオフにする (すべてを環境変数で指定)
```
TOKEN="TOKEN="0acc082716944f3a421fcc9c17c968ccc1ce52589d61d7d8d87d334bbe25e43888a919210d095190b4be941263a1ae97" \
DEVICE_IDS="1,01-202207310613-00000001" \
ACTION="setOff" \
./entry.sh
```

## おまけ（デモの設定内容）
### 環境
- Ulauncher v5.15.6

### 設定
- `Name`: (任意)
- `Keyward`: (任意)
- `Query or Script`:
```
#!/bin/bash
TOKEN="0acc082716944f3a421fcc9c17c968ccc1ce52589d61d7d8d87d334bbe25e43888a919210d095190b4be941263a1ae97" \
DEVICE_IDS="1,01-202207310613-85329752" \
ACTION="setOn" \
/home/rca/proj/shell-swbot/entry.sh
```
- `Default search`: false
- `Run without arguments`: true

#### 注意点
- `#!/bin/bash`をつけてスクリプトとして実行しないとサジェスト時にTOKENが表示されてしまいます.

![image](https://github.com/r-ca/shell-swbot/assets/66072112/e40d84f7-68d3-4a69-b850-4454804613f9)
![image](https://github.com/r-ca/shell-swbot/assets/66072112/7e2fa1f6-6145-4506-8fae-49be3719fcf5)
