// Author: Maurus Item <itemm@student.ethz.ch>, ETH Zurich
// Date: 25.04.2024
// Description: Interface in between retry modules to transmit which elements need to be tried again

interface retry_interface #(
  parameter IDSize = 0
) ( 
  /* No ports on this interface */ 
);
    logic [IDSize-1:0] id;
    logic valid;
    logic needs_retry;
    logic is_ready; // Parallel signal to other
    logic fine;

    modport start (
      input id,
      input valid,
      input needs_retry,
      input is_ready,
      output fine
    );

    modport ende (
      output id,
      output valid,
      output needs_retry,
      output is_ready,
      input fine
    );
endinterface