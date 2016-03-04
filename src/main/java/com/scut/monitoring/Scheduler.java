package com.scut.monitoring;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;


public class Scheduler
{
	/*public void sendScheduler(String dateStr){
        final Timer timer = new Timer();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ParsePosition pos = new ParsePosition(0);
        Date currentTime = formatter.parse(dateStr, pos);
        //计划开始运行之后每间隔1秒运行一次
        timer.schedule(new TimerTask()
        {
            @Override
            public void run() 
            {
                //可以放入要执行的方法
                System.out.println("计划开始了！"+new Date().toString());
                timer.cancel(); //计划取消
            }
        }, currentTime, 1000);
    }*/
} 
