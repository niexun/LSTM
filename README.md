# LSTM
LSTM neural network (verilog)

We implemented this system using Verilog. The synthesis were conducted by Vivado 2017.4. We divided the system into four modules: Gate, Network, Controller, and Memory [Controller]. The Verilog code is parametrized and can be used for different values of word lengths. We used IP cores of Vivado for implementing adders and multipliers of the system. Sigmoid and tanh modules are designed using peace-wise linear approximation. The Gate module is responsible for producing f_t, i_t, g_t, and o_t. The Network module is responsible for activation operation and the computation of output vector h_t.
