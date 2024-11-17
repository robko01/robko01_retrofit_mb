# robko01_retrofit_mb

 - **BOM**

|Id |Designator             |Footprint                                                                    |Quantity|Designation          |Supplier and ref|FIELD7|FIELD8|
|---|-----------------------|-----------------------------------------------------------------------------|--------|---------------------|----------------|------|------|
|1  |D3,D4                  |LED_D5.0mm                                                                   |2       |LED                  |                |      |      |
|2  |SW2,SW1,SW5,SW7,SW3,SW4|DIP-8_W7.62mm                                                                |6       |SW_DIP_x04           |                |      |      |
|3  |C9,C13,C11,C7,C3,C5    |C_Disc_D7.0mm_W2.5mm_P5.00mm                                                 |6       |100n                 |                |      |      |
|4  |C4,C10,C12,C6,C14,C8   |CP_Radial_D8.0mm_P3.50mm                                                     |6       |100u                 |                |      |      |
|5  |J18,J20,J19,J30,J17,J31|PinHeader_1x02_P2.54mm_Vertical                                              |6       |Conn_01x02_Male      |                |      |      |
|6  |A1,A4,A2,A6,A5,A3      |Pololu_Breakout-16_15.2x20.3mm                                               |6       |Pololu_Breakout_A4988|                |      |      |
|7  |D2,D1                  |D_DO-41_SOD81_P10.16mm_Horizontal                                            |2       |1N4007               |                |      |      |
|8  |R1                     |R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal                            |1       |2k                   |                |      |      |
|9  |K2                     |Relay_DPDT_Omron_G5V-2                                                       |1       |G5V-2                |                |      |      |
|10 |J21,J22                |PinSocket_1x19_P2.54mm_Vertical                                              |2       |Conn_01x19_Pin       |                |      |      |
|11 |J14,J1,J4,J16,J12,J6   |PinHeader_1x04_P2.54mm_Vertical                                              |6       |Conn_01x04_Pin       |                |      |      |
|12 |J10,J11,J9             |PinHeader_1x13_P2.54mm_Vertical                                              |3       |Motors               |                |      |      |
|13 |J28,J7                 |PhoenixContact_MSTBA_2,5_2-G-5,08_1x02_P5.08mm_Horizontal                    |2       |Conn_01x02_Male      |                |      |      |
|14 |F1                     |Fuseholder_Clip-5x20mm_Bel_FC-203-22_Lateral_P17.80x5.00mm_D1.17mm_Horizontal|1       |Fuse                 |                |      |      |
|15 |J19,J20                |PinHeader_1x01_P2.54mm_Vertical                                              |2       |Conn_01x01_Pin       |                |      |      |
|16 |J24,J25,J26            |PinHeader_1x04_P2.54mm_Horizontal                                            |3       |Conn_01x04_Pin       |                |      |      |
|17 |J15,J2,J5,J13,J8,J3    |PinHeader_1x02_P2.54mm_Vertical                                              |6       |Conn_01x02_Pin       |                |      |      |
|18 |J29                    |PinHeader_1x07_P2.54mm_Horizontal                                            |1       |Conn_01x07_Pin       |                |      |      |
|19 |J27,J23                |PinHeader_1x06_P2.54mm_Horizontal                                            |2       |Conn_01x06_Pin       |                |      |      |
|20|(J21 and J22)|ESP32-WROOM-32D|1|Main CPI board.|
|21|(J17,J18,J19,J20,J31)|MP1584EN|1|Low voltage DC/DC convertor.|

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
| Motor 6 Direction | GPIO32 | OUTPUT | ```#define M6_DIR 32```|
| Motor 6 Step | GPIO33 | OUTPUT | ```#define M6_STP 33```|
| Motor 1 Limit | GPIO36 | INPUT_PULLUP | ```#define M1_LIMIT 36```|
| Motor 2 Limit | GPIO39 | INPUT_PULLUP | ```#define M2_LIMIT 39```|
| Motor 3 Limit | GPIO34 | INPUT_PULLUP | ```#define M3_LIMIT 34```|
| Motor 6 Limit | GPIO35 | INPUT_PULLUP | ```#define M6_LIMIT 35```|

