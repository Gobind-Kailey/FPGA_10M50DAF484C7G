# FPGA_10M50DAF484C7G
Learning how to code in Verilog and VHDL through QuartusPrime and simulating in Questa/Modelsim and testing on my 10M50DAF484C7G FPGA board.

Below is my FPGA Board: 

![FPFA_MAX10](https://github.com/user-attachments/assets/6c286d56-efc1-4ed0-b6c2-7f449e3d87bd)



## **First Test: Binary-to-decimal number converter.**

Designing combinational circuits that can perform binary-to-decimal number conversions; 
- For HEX0 and HEX1, we use switches 7-4 and 3-1, respectively. Depending on what the input is in Decimal number would be shown. 
For example, in the image below
- Anything above 9 will just be dispaced as a dont care, and I have it programmed to switch that specific HEX off. 

Example Showcase: 
![IMG_5960 (3)](https://github.com/user-attachments/assets/92ba19c1-1a7b-4740-b2e4-92808bc16da8)


You can see that in the Switches (SW) 3 downto 1 we have inputted 1001, that is 9 in decimal, and that is displayed in HEX0. 
You can also noitce that switches 7 downto 4, we have input 0010 which correctly translates to a value of 2 in binary displayed on HEX1. 

The code for this is attached in: [Binary to Decimal using 7 switches](Binary_to_decimal_7)

## **Second Test: Four-bit binary input to Two-digit Decimal Output.** 

Converts a four-bit binary number V = v3v2v1v0 into a two-digit decimal equivalent D = d1d0. 

For example, if the input (V = 1111), then we would get 15 as the output in the 7-segment displays. 
Use a comparator to check when the value of V is greater than 9, and use the output of this comparator to control what each of the 7-segment displays. 
Another example shown below would be if V=1011, the binary value translates to a decimal value of 11, which is displayed as expected. 

Example Showcase: 
![IMG_5986 (1)](https://github.com/user-attachments/assets/81d7f4d1-c703-4644-a79e-e850b53ea3cb)


The Code for this is attached in:  [Binary to Decimal using 4 switches](Binary_to_Decimal_4)

