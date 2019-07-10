/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Proyecto #2 - IE-0523 - Arvhivo de includes 
 *@author Giancarlo Marin H.
 *@date   08/07/2019
 *@brief  Contiene la lista de archivos necesarios para crear la capa de transaccion del PCIe
*/

// Si no se ha creado 
`ifndef _my_incl_vh_
`define _my_incl_vh_

// includes
`include "buffer.v"
`include "demux.v"
`include "demux_MF.v"
`include "fifo_main.v"
`include "fifo_vc0.v"
`include "fifo_vc1.v"
`include "fifo_d0.v"
`include "fifo_d1.v"
`include "fsm.v"
`include "input_flow.v"
`include "output_flow.v"
`include "mux.v"
`endif

