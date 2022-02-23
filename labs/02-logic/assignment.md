# Lab 2: ECEMDOGA_ARICA
### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   <img width="502" alt="Ekran Resmi 2022-02-23 22 50 34" src="https://user-images.githubusercontent.com/99410918/155414703-edfe853d-a1fb-4f2e-8484-159568b6a18a.png">


   Less than:

   <img width="432" alt="Ekran Resmi 2022-02-23 22 50 51" src="https://user-images.githubusercontent.com/99410918/155414734-95f75c1f-aaac-4d1b-aadb-925783a66844.png">


2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![WhatsApp Image 2022-02-23 at 10 49 25 PM](https://user-images.githubusercontent.com/99410918/155414861-b3ae0795-20bc-4e55-b7c3-01894eb3e0ec.jpeg)


### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx??**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_b <= "0011"; -- ID = xxxx30
        s_a <= "0000"; -- ID = xxxx30
       wait for 100 ns;
              
        -- Expected output
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination 00, 00 FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;


```

2. Text console screenshot during your simulation, including reports.

   <img width="1380" alt="DigitalElectronicsLab2" src="https://user-images.githubusercontent.com/99410918/154556835-2a605521-deb3-47a2-b67a-3cc589540ee0.png">


3. Link to your public EDA Playground example:

   https://www.edaplayground.com/x/ArVe
