# Summary

`ActiveSupport::Notifications`を使用して、RailsでPub/Subモデルパターンを実装するサンプル

# 使い方
## Subscriber

`app/subscriber`ディレクトリを作成し、そこにsubscriberを作成

### sample_subscriber.rb

メッセージを受け取ったsample_subscriberは、railsログにイベント名と、引数を出力するだけ。

## Publisher
### 確認方法

```
$ rails c
$ SampleSubscriber::Notifications.instrument('output_logger.sample.SampleSubscriber', "payload")

```
メッセージの送信は、`instrument`メソッドで行います。
第一引数に、イベント名を指定し、第二引数に任意の引数を渡す事ができます。

#### 特定の処理が終わった後にpublishしたい場合

```
SampleSubscriber::Notifications.instrument('output_logger.sample.SampleSubscriber', "payload") do
sleep 1
p 'hello'
sleep 1
end
```

instrumentブロックの中に書いた処理が実行された後にpublishされます

# Document

See: https://edgeguides.rubyonrails.org/active_support_instrumentation.html