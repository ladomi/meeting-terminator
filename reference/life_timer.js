//即時関数で囲う
(function(){

    //厳密なエラーチェックのための記述
    'use strict'; 

    var timer = document.getElementById('timer');
    var min = document.getElementById('min');
    var sec = document.getElementById('sec');
    var reset = document.getElementById('reset');
    var start = document.getElementById('start');

    //スタートタイムを押した時の時間を入れる変数
    var startTime;

    //残り時間を計算するための変数
    var timeLeft;

    //とりあえず4秒で設定しておく。 現在時刻と表示形式を合わせるために * 1000
    var timeToCountDown = 4 * 1000;


    //残り時間を表示するためにミリ秒を渡すと分とか秒に直してくれる関数を作る
    function updateTimer(t){

    //引数として渡されたtでデータオブジェクトを作りたいので変数dという変数名で作ってみる
    var d = new Date(t);

    var m = d.getMinutes();
    var s = d.getSeconds();
    var ms = d.getMilliseconds();
    m = ('0' + m).slice(-2);
    s = ('0' + s).slice(-2);
    ms = ('00' + ms).slice(-3);
    timer.textContent =  m + ':' + s + ':' + ms;

    }


    function countDown(){

        //setTimeoutを使って次の処理を10ミリ秒後に実行するようにする
        setTimeout(function(){

        //残り時間 = カウントされる時間 - 現在時刻
        timeLeft = timeToCountDown - (Date.now() - startTime);

        //countDownを再帰的に呼び出すためのに記述

        updateTimer(timeLeft)
        countDown();

       //1秒以下の時間も表示されるようにする
        },10);
    }

    //startを押した際に発火するイベント
    start.addEventListener('click',function(){
        startTime = Date.now();

        //カウントダウンの機能は再帰的に実行したいのでcountDown関数を入れとく
        countDown();
    });
})();
