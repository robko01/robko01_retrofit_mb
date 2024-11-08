# robko01_retrofit_mb

 - **Pinmap**

| Function | ESP32 | Direction | C Code |
|----------|:-------------|:------|----|
| Enable Motors | GPIO2 | OUTPUT | ```#define MX_ENB 2```|
| Motor 1 Direction | GPIO4 | OUTPUT | ```#define M1_DIR 4```|
| Motor 1 Step | GPIO0 | OUTPUT | ```#define M1_STP 0```|
| Motor 2 Direction | GPIO17 | OUTPUT | ```#define M2_DIR 17```|
| Motor 2 Step | GPIO16 | OUTPUT | ```#define M2_STP 16```|
| Motor 3 Direction | GPIO25 | OUTPUT | ```#define M3_DIR 25```|
| Motor 3 Step | GPIO26 | OUTPUT | ```#define M3_STP 26```|
| Motor 4 Direction | GPIO12 | OUTPUT | ```#define M4_DIR 12```|
| Motor 4 Step | GPIO13 | OUTPUT | ```#define M4_STP 13```|
| Motor 5 Direction | GPIO27 | OUTPUT | ```#define M5_DIR 27```|
| Motor 5 Step | GPIO14 | OUTPUT | ```#define M5_STP 14```|
| Motor 6 Direction | GPIO33 | OUTPUT | ```#define M6_DIR 33```|
| Motor 6 Step | GPIO36 | OUTPUT | ```#define M6_STP 36```|
| Motor 1 Limit | GPIO36 | INPUT_PULLUP | ```#define M1_LIMIT 36```|
| Motor 2 Limit | GPIO39 | INPUT_PULLUP | ```#define M2_LIMIT 39```|
| Motor 3 Limit | GPIO34 | INPUT_PULLUP | ```#define M3_LIMIT 34```|
| Motor 6 Limit | GPIO35 | INPUT_PULLUP | ```#define M6_LIMIT 35```|

