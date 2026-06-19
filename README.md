32×32 BOOTH-WALLACE MULTIPLIER

OJECTIVE:
To design and implement a high-speed 32×32 
multiplier using Booth encoding (Radix-8) and Wallace tree 
technique in Verilog, in order to achieve reduced partial 
products and faster computation. 

FEATURES:
> Radix-8 Booth Encoding
> Wallace Tree Reduction
> 3:2 Compressor
> 4:2 Compressor
> 5:2 Compressor
> High-Speed Multiplication
> Verilog HDL Implementation

TOOLS USED:
 > Verilog HDL
 > ModelSim
 > Quartus Prime

ALGORITHM: 
1. Input two 32-bit numbers A and B. 
2. Apply Booth encoding (Radix-8) on multiplier. 
3. Generate partial products using shifted multiplicand. 
4. Reduce partial products using Wallace tree compressors. 
5. Obtain final sum and carry. 
6. Add sum with shifted carry to get output P.

OUTPUT WAVE FORM:
<img width="983" height="226" alt="image" src="https://github.com/user-attachments/assets/efe2dd85-5edc-4d88-9531-b0a35294353c" />

<img width="365" height="149" alt="image" src="https://github.com/user-attachments/assets/0eaef468-251c-4507-a73a-6e7cb825bde9" />

RTL VIEWER:
<img width="991" height="231" alt="image" src="https://github.com/user-attachments/assets/60e68d01-3cdc-46c2-9328-b855b8be9a3a" />

RESULT:
The 32×32 Booth-Wallace multiplier was successfully 
designed and implemented using Verilog. The simulation 
results verified that the output product is correct for given 
inputs. The design achieved faster multiplication with reduced 
partial products and efficient hardware utilization.



