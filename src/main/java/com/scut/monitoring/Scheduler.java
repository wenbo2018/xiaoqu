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
        //�ƻ���ʼ����֮��ÿ���1������һ��
        timer.schedule(new TimerTask()
        {
            @Override
            public void run() 
            {
                //���Է���Ҫִ�еķ���
                System.out.println("�ƻ���ʼ�ˣ�"+new Date().toString());
                timer.cancel(); //�ƻ�ȡ��
            }
        }, currentTime, 1000);
    }*/
} 
