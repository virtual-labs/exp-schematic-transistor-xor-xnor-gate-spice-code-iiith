### Spice Code Platform

#### Code -

- The code block that defines the name of the gate, includes file, and declares parameters should be placed first, followed by the code block that defines the voltage source, then the block that defines the inverter subcircuit, followed by the netlist statement that instantiates and calls the respective gate subcircuit, then the block that defines the input waveform 'a', 'b' followed by the control statements to run the circuit and plot the required graphs, and then finally the end of code block.
- Drag and drop the code blocks to arrange them in the order mentioned above.
- Now enter the name of the MOSFET model file to be included ("PTM_45nm.txt").
- To define the voltage source, enter a name for it and then select vdd as the positive terminal and 0 or gnd as the negative terminal.
  Now, define the subcircuit by giving it a name and also giving names to the input and output arguments of the subcircuit.
  Inside this subcircuit, we need to call inverter and pass transistor subcircuits which are built using PMOS and NMOS, and these connections are given as follows:

The connections for each MOSFET should follow this template:

<pre>
INSTANCE_NAME DRAIN GATE SOURCE BODY
NAME_OF_MOSFET_AS_MENTIONED_IN_MODEL_FILE_INCLUDED w=WIDTH l=LENGTH
</pre>

**Wiring Steps:**

- Assign a unique instance name to each NMOS and PMOS transistor.
- Connect the body of PMOS to VDD, and the body of NMOS to GND or 0.
- Make the remaining connections as shown in previous experiments and circuit diagrams.

Then inside the main subcircuit block, instantiate the inverter and pass transistor subcircuits according to the following connections in the figures.
Now end the subcircuit block by `.ends`.
Now call this gate subcircuit by giving an instance name, then by giving 'a', 'b' as inputs and 'out' as output and then complete the call by typing in the respective gate subcircuit name.

**Note:**
While giving names to the subcircuit, nodes, variables and instance names, make sure that they begin with either alphabets, '%', '$' or '_' character only and they can only contain alphanumeric characters, '%', '$' and '\_' characters only. The SPICE code is case insensitive so make sure to not give the same names to any two variables in the same circuit or subcircuit irrespective of the case.

**Connections for XOR**
<img src="images/xor.png">

**Connections for XNOR**
<img src="images/xnor.png">

**Step-by-Step Wiring Table: XOR Gate**

| Step | Action                  | Description                                                |
| ---- | ----------------------- | ---------------------------------------------------------- |
| 1    | Build Inverter          | Construct inverter subcircuit for input signals            |
| 2    | Add Pass Transistors    | Place NMOS and PMOS pass transistors for each input branch |
| 3    | Connect Control Signals | Use complementary inputs to control transmission gates     |
| 4    | Combine Outputs         | Merge outputs from transmission gates to form XOR output   |

**Step-by-Step Wiring Table: XNOR Gate**

| Step | Action                  | Description                                                |
| ---- | ----------------------- | ---------------------------------------------------------- |
| 1    | Build Inverter          | Construct inverter subcircuit for input signals            |
| 2    | Add Pass Transistors    | Place NMOS and PMOS pass transistors for each input branch |
| 3    | Connect Control Signals | Use complementary inputs to control transmission gates     |
| 4    | Combine Outputs         | Merge outputs from transmission gates to form XNOR output  |

#### Observations -

- On clicking "validate" option after completing the code (assuming everything is filled correctly) you should see a "Success" message, a report, an input graph and an output graph under the observations section.
- Observe the input wave and the corresponding output wave.
