neopixel_code.ino reads inputs from the serial terminal to configure which neopixels are on or off.

In order to configure the LEDs, 15 bit codes should be sent in the following manner.

1xxxxxrrrgggbbb - with the MSB set to 1, the neopixel at address xxxxx will be turned on with the color (rrr,ggg,bbb).
0xxxxx000000000 - with the MSB set to 0, the neopixel at address xxxxx will be turned off.

The neopixel addresses start at 00001 for the first neopixel and count to 10010 for the 18th neopixel.

Each color code needs to be 3 digits long ==> 20 needs to be sent as 020.

For example, in order to turn on the 7th neopixel with the color red (50,0,0):
	send code 100111050000000

In order to turn off the 12th neopixel:
	send code 001100000000000



6 bits of all 1s (111111rrrgggbbb) will set all 18 neopixels to ON with the color (rrr,ggg,bbb)

6 bits of 0s (000000000000000) will set all 18 neopixels to OFF
