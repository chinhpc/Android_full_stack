/*
 * Copyright (C) 2007 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.example.android.blink;

import android.util.Log;
import android.app.Service;
import android.os.IBinder;
import android.content.Intent;
import java.util.concurrent.*;
import com.softwinner.Gpio;

// import android.widget.TextView;

/**
 * Use a custom platform library.
 */
public class blink extends Service {

    @Override
    public void onCreate() {

        ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();
        ScheduledExecutorService scheduler2 = Executors.newSingleThreadScheduledExecutor();

        scheduler.scheduleAtFixedRate(new Runnable() {
            public void run() {
                chanceLedStatus(1);
                Log.i("\nChinhPC", "LED ON\n");
            }
        }, 0, 800, TimeUnit.MILLISECONDS);

        try {
            TimeUnit.MILLISECONDS.sleep(400);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        scheduler2.scheduleAtFixedRate(new Runnable() {
            public void run() {
                chanceLedStatus(0);
                Log.i("\nChinhPC", "LED OFF\n");
            }
        }, 0, 800, TimeUnit.MILLISECONDS);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        // The service is starting, due to a call to startService()
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        // We don't provide binding, so return null
        return null;
    }

    private void chanceLedStatus(int status) {
        char portType = 'A';
        int portNum = 17;
        Gpio.writeGpio(portType, portNum, status);
    }
}

