// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// SECDED Decoder generated by secded_gen.py

module prim_secded_137_128_dec (
  input        [136:0] in,
  output logic [127:0] d_o,
  output logic [8:0] syndrome_o,
  output logic [1:0] err_o
);

  logic single_error;

  // Syndrome calculation
  assign syndrome_o[0] = in[128] ^ in[0] ^ in[1] ^ in[2] ^ in[3] ^ in[4] ^ in[5] ^ in[6] ^ in[7]
                       ^ in[8] ^ in[9] ^ in[10] ^ in[11] ^ in[12] ^ in[13] ^ in[14] ^ in[15]
                       ^ in[16] ^ in[17] ^ in[18] ^ in[19] ^ in[20] ^ in[21] ^ in[22] ^ in[23]
                       ^ in[24] ^ in[25] ^ in[26] ^ in[27] ^ in[84] ^ in[85] ^ in[86] ^ in[87]
                       ^ in[89] ^ in[94] ^ in[95] ^ in[98] ^ in[101] ^ in[102] ^ in[103] ^ in[105]
                       ^ in[106] ^ in[108] ^ in[110] ^ in[111] ^ in[113] ^ in[114] ^ in[119]
                       ^ in[121] ^ in[123] ^ in[124] ^ in[125] ^ in[126];
  assign syndrome_o[1] = in[129] ^ in[0] ^ in[1] ^ in[2] ^ in[3] ^ in[4] ^ in[5] ^ in[6] ^ in[28]
                       ^ in[29] ^ in[30] ^ in[31] ^ in[32] ^ in[33] ^ in[34] ^ in[35] ^ in[36]
                       ^ in[37] ^ in[38] ^ in[39] ^ in[40] ^ in[41] ^ in[42] ^ in[43] ^ in[44]
                       ^ in[45] ^ in[46] ^ in[47] ^ in[48] ^ in[86] ^ in[88] ^ in[90] ^ in[91]
                       ^ in[92] ^ in[93] ^ in[96] ^ in[97] ^ in[100] ^ in[101] ^ in[103] ^ in[105]
                       ^ in[106] ^ in[108] ^ in[110] ^ in[115] ^ in[116] ^ in[117] ^ in[118]
                       ^ in[120] ^ in[121] ^ in[122] ^ in[124] ^ in[125] ^ in[126];
  assign syndrome_o[2] = in[130] ^ in[0] ^ in[7] ^ in[8] ^ in[9] ^ in[10] ^ in[11] ^ in[12] ^ in[28]
                       ^ in[29] ^ in[30] ^ in[31] ^ in[32] ^ in[33] ^ in[49] ^ in[50] ^ in[51]
                       ^ in[52] ^ in[53] ^ in[54] ^ in[55] ^ in[56] ^ in[57] ^ in[58] ^ in[59]
                       ^ in[60] ^ in[61] ^ in[62] ^ in[63] ^ in[84] ^ in[85] ^ in[89] ^ in[90]
                       ^ in[93] ^ in[94] ^ in[96] ^ in[97] ^ in[98] ^ in[99] ^ in[102] ^ in[104]
                       ^ in[109] ^ in[110] ^ in[112] ^ in[113] ^ in[114] ^ in[116] ^ in[117]
                       ^ in[118] ^ in[120] ^ in[122] ^ in[124] ^ in[126];
  assign syndrome_o[3] = in[131] ^ in[1] ^ in[7] ^ in[13] ^ in[14] ^ in[15] ^ in[16] ^ in[17]
                       ^ in[28] ^ in[34] ^ in[35] ^ in[36] ^ in[37] ^ in[38] ^ in[49] ^ in[50]
                       ^ in[51] ^ in[52] ^ in[53] ^ in[64] ^ in[65] ^ in[66] ^ in[67] ^ in[68]
                       ^ in[69] ^ in[70] ^ in[71] ^ in[72] ^ in[73] ^ in[84] ^ in[85] ^ in[87]
                       ^ in[88] ^ in[89] ^ in[91] ^ in[92] ^ in[93] ^ in[94] ^ in[97] ^ in[98]
                       ^ in[100] ^ in[101] ^ in[104] ^ in[105] ^ in[107] ^ in[108] ^ in[109]
                       ^ in[116] ^ in[118] ^ in[119] ^ in[121] ^ in[122] ^ in[127];
  assign syndrome_o[4] = in[132] ^ in[2] ^ in[8] ^ in[13] ^ in[18] ^ in[19] ^ in[20] ^ in[21]
                       ^ in[29] ^ in[34] ^ in[39] ^ in[40] ^ in[41] ^ in[42] ^ in[49] ^ in[54]
                       ^ in[55] ^ in[56] ^ in[57] ^ in[64] ^ in[65] ^ in[66] ^ in[67] ^ in[74]
                       ^ in[75] ^ in[76] ^ in[77] ^ in[78] ^ in[79] ^ in[84] ^ in[86] ^ in[87]
                       ^ in[89] ^ in[91] ^ in[94] ^ in[95] ^ in[97] ^ in[99] ^ in[103] ^ in[104]
                       ^ in[107] ^ in[110] ^ in[111] ^ in[112] ^ in[115] ^ in[116] ^ in[117]
                       ^ in[119] ^ in[120] ^ in[121] ^ in[123] ^ in[124] ^ in[125];
  assign syndrome_o[5] = in[133] ^ in[3] ^ in[9] ^ in[14] ^ in[18] ^ in[22] ^ in[23] ^ in[24]
                       ^ in[30] ^ in[35] ^ in[39] ^ in[43] ^ in[44] ^ in[45] ^ in[50] ^ in[54]
                       ^ in[58] ^ in[59] ^ in[60] ^ in[64] ^ in[68] ^ in[69] ^ in[70] ^ in[74]
                       ^ in[75] ^ in[76] ^ in[80] ^ in[81] ^ in[82] ^ in[87] ^ in[88] ^ in[90]
                       ^ in[91] ^ in[93] ^ in[95] ^ in[98] ^ in[99] ^ in[100] ^ in[101] ^ in[102]
                       ^ in[103] ^ in[105] ^ in[106] ^ in[107] ^ in[112] ^ in[114] ^ in[115]
                       ^ in[117] ^ in[118] ^ in[122] ^ in[123] ^ in[125] ^ in[126] ^ in[127];
  assign syndrome_o[6] = in[134] ^ in[4] ^ in[10] ^ in[15] ^ in[19] ^ in[22] ^ in[25] ^ in[26]
                       ^ in[31] ^ in[36] ^ in[40] ^ in[43] ^ in[46] ^ in[47] ^ in[51] ^ in[55]
                       ^ in[58] ^ in[61] ^ in[62] ^ in[65] ^ in[68] ^ in[71] ^ in[72] ^ in[74]
                       ^ in[77] ^ in[78] ^ in[80] ^ in[81] ^ in[83] ^ in[84] ^ in[86] ^ in[88]
                       ^ in[90] ^ in[92] ^ in[95] ^ in[96] ^ in[97] ^ in[99] ^ in[102] ^ in[103]
                       ^ in[104] ^ in[107] ^ in[109] ^ in[111] ^ in[112] ^ in[113] ^ in[115]
                       ^ in[119] ^ in[120] ^ in[121] ^ in[122] ^ in[123] ^ in[124] ^ in[127];
  assign syndrome_o[7] = in[135] ^ in[5] ^ in[11] ^ in[16] ^ in[20] ^ in[23] ^ in[25] ^ in[27]
                       ^ in[32] ^ in[37] ^ in[41] ^ in[44] ^ in[46] ^ in[48] ^ in[52] ^ in[56]
                       ^ in[59] ^ in[61] ^ in[63] ^ in[66] ^ in[69] ^ in[71] ^ in[73] ^ in[75]
                       ^ in[77] ^ in[79] ^ in[80] ^ in[82] ^ in[83] ^ in[85] ^ in[86] ^ in[87]
                       ^ in[92] ^ in[94] ^ in[95] ^ in[96] ^ in[100] ^ in[101] ^ in[106] ^ in[107]
                       ^ in[108] ^ in[109] ^ in[110] ^ in[111] ^ in[112] ^ in[113] ^ in[114]
                       ^ in[115] ^ in[118] ^ in[120] ^ in[125] ^ in[126] ^ in[127];
  assign syndrome_o[8] = in[136] ^ in[6] ^ in[12] ^ in[17] ^ in[21] ^ in[24] ^ in[26] ^ in[27]
                       ^ in[33] ^ in[38] ^ in[42] ^ in[45] ^ in[47] ^ in[48] ^ in[53] ^ in[57]
                       ^ in[60] ^ in[62] ^ in[63] ^ in[67] ^ in[70] ^ in[72] ^ in[73] ^ in[76]
                       ^ in[78] ^ in[79] ^ in[81] ^ in[82] ^ in[83] ^ in[85] ^ in[88] ^ in[89]
                       ^ in[90] ^ in[91] ^ in[92] ^ in[93] ^ in[96] ^ in[98] ^ in[99] ^ in[100]
                       ^ in[102] ^ in[104] ^ in[105] ^ in[106] ^ in[108] ^ in[109] ^ in[111]
                       ^ in[113] ^ in[114] ^ in[116] ^ in[117] ^ in[119] ^ in[123] ^ in[127];

  // Corrected output calculation
  assign d_o[0] = (syndrome_o == 9'h7) ^ in[0];
  assign d_o[1] = (syndrome_o == 9'hb) ^ in[1];
  assign d_o[2] = (syndrome_o == 9'h13) ^ in[2];
  assign d_o[3] = (syndrome_o == 9'h23) ^ in[3];
  assign d_o[4] = (syndrome_o == 9'h43) ^ in[4];
  assign d_o[5] = (syndrome_o == 9'h83) ^ in[5];
  assign d_o[6] = (syndrome_o == 9'h103) ^ in[6];
  assign d_o[7] = (syndrome_o == 9'hd) ^ in[7];
  assign d_o[8] = (syndrome_o == 9'h15) ^ in[8];
  assign d_o[9] = (syndrome_o == 9'h25) ^ in[9];
  assign d_o[10] = (syndrome_o == 9'h45) ^ in[10];
  assign d_o[11] = (syndrome_o == 9'h85) ^ in[11];
  assign d_o[12] = (syndrome_o == 9'h105) ^ in[12];
  assign d_o[13] = (syndrome_o == 9'h19) ^ in[13];
  assign d_o[14] = (syndrome_o == 9'h29) ^ in[14];
  assign d_o[15] = (syndrome_o == 9'h49) ^ in[15];
  assign d_o[16] = (syndrome_o == 9'h89) ^ in[16];
  assign d_o[17] = (syndrome_o == 9'h109) ^ in[17];
  assign d_o[18] = (syndrome_o == 9'h31) ^ in[18];
  assign d_o[19] = (syndrome_o == 9'h51) ^ in[19];
  assign d_o[20] = (syndrome_o == 9'h91) ^ in[20];
  assign d_o[21] = (syndrome_o == 9'h111) ^ in[21];
  assign d_o[22] = (syndrome_o == 9'h61) ^ in[22];
  assign d_o[23] = (syndrome_o == 9'ha1) ^ in[23];
  assign d_o[24] = (syndrome_o == 9'h121) ^ in[24];
  assign d_o[25] = (syndrome_o == 9'hc1) ^ in[25];
  assign d_o[26] = (syndrome_o == 9'h141) ^ in[26];
  assign d_o[27] = (syndrome_o == 9'h181) ^ in[27];
  assign d_o[28] = (syndrome_o == 9'he) ^ in[28];
  assign d_o[29] = (syndrome_o == 9'h16) ^ in[29];
  assign d_o[30] = (syndrome_o == 9'h26) ^ in[30];
  assign d_o[31] = (syndrome_o == 9'h46) ^ in[31];
  assign d_o[32] = (syndrome_o == 9'h86) ^ in[32];
  assign d_o[33] = (syndrome_o == 9'h106) ^ in[33];
  assign d_o[34] = (syndrome_o == 9'h1a) ^ in[34];
  assign d_o[35] = (syndrome_o == 9'h2a) ^ in[35];
  assign d_o[36] = (syndrome_o == 9'h4a) ^ in[36];
  assign d_o[37] = (syndrome_o == 9'h8a) ^ in[37];
  assign d_o[38] = (syndrome_o == 9'h10a) ^ in[38];
  assign d_o[39] = (syndrome_o == 9'h32) ^ in[39];
  assign d_o[40] = (syndrome_o == 9'h52) ^ in[40];
  assign d_o[41] = (syndrome_o == 9'h92) ^ in[41];
  assign d_o[42] = (syndrome_o == 9'h112) ^ in[42];
  assign d_o[43] = (syndrome_o == 9'h62) ^ in[43];
  assign d_o[44] = (syndrome_o == 9'ha2) ^ in[44];
  assign d_o[45] = (syndrome_o == 9'h122) ^ in[45];
  assign d_o[46] = (syndrome_o == 9'hc2) ^ in[46];
  assign d_o[47] = (syndrome_o == 9'h142) ^ in[47];
  assign d_o[48] = (syndrome_o == 9'h182) ^ in[48];
  assign d_o[49] = (syndrome_o == 9'h1c) ^ in[49];
  assign d_o[50] = (syndrome_o == 9'h2c) ^ in[50];
  assign d_o[51] = (syndrome_o == 9'h4c) ^ in[51];
  assign d_o[52] = (syndrome_o == 9'h8c) ^ in[52];
  assign d_o[53] = (syndrome_o == 9'h10c) ^ in[53];
  assign d_o[54] = (syndrome_o == 9'h34) ^ in[54];
  assign d_o[55] = (syndrome_o == 9'h54) ^ in[55];
  assign d_o[56] = (syndrome_o == 9'h94) ^ in[56];
  assign d_o[57] = (syndrome_o == 9'h114) ^ in[57];
  assign d_o[58] = (syndrome_o == 9'h64) ^ in[58];
  assign d_o[59] = (syndrome_o == 9'ha4) ^ in[59];
  assign d_o[60] = (syndrome_o == 9'h124) ^ in[60];
  assign d_o[61] = (syndrome_o == 9'hc4) ^ in[61];
  assign d_o[62] = (syndrome_o == 9'h144) ^ in[62];
  assign d_o[63] = (syndrome_o == 9'h184) ^ in[63];
  assign d_o[64] = (syndrome_o == 9'h38) ^ in[64];
  assign d_o[65] = (syndrome_o == 9'h58) ^ in[65];
  assign d_o[66] = (syndrome_o == 9'h98) ^ in[66];
  assign d_o[67] = (syndrome_o == 9'h118) ^ in[67];
  assign d_o[68] = (syndrome_o == 9'h68) ^ in[68];
  assign d_o[69] = (syndrome_o == 9'ha8) ^ in[69];
  assign d_o[70] = (syndrome_o == 9'h128) ^ in[70];
  assign d_o[71] = (syndrome_o == 9'hc8) ^ in[71];
  assign d_o[72] = (syndrome_o == 9'h148) ^ in[72];
  assign d_o[73] = (syndrome_o == 9'h188) ^ in[73];
  assign d_o[74] = (syndrome_o == 9'h70) ^ in[74];
  assign d_o[75] = (syndrome_o == 9'hb0) ^ in[75];
  assign d_o[76] = (syndrome_o == 9'h130) ^ in[76];
  assign d_o[77] = (syndrome_o == 9'hd0) ^ in[77];
  assign d_o[78] = (syndrome_o == 9'h150) ^ in[78];
  assign d_o[79] = (syndrome_o == 9'h190) ^ in[79];
  assign d_o[80] = (syndrome_o == 9'he0) ^ in[80];
  assign d_o[81] = (syndrome_o == 9'h160) ^ in[81];
  assign d_o[82] = (syndrome_o == 9'h1a0) ^ in[82];
  assign d_o[83] = (syndrome_o == 9'h1c0) ^ in[83];
  assign d_o[84] = (syndrome_o == 9'h5d) ^ in[84];
  assign d_o[85] = (syndrome_o == 9'h18d) ^ in[85];
  assign d_o[86] = (syndrome_o == 9'hd3) ^ in[86];
  assign d_o[87] = (syndrome_o == 9'hb9) ^ in[87];
  assign d_o[88] = (syndrome_o == 9'h16a) ^ in[88];
  assign d_o[89] = (syndrome_o == 9'h11d) ^ in[89];
  assign d_o[90] = (syndrome_o == 9'h166) ^ in[90];
  assign d_o[91] = (syndrome_o == 9'h13a) ^ in[91];
  assign d_o[92] = (syndrome_o == 9'h1ca) ^ in[92];
  assign d_o[93] = (syndrome_o == 9'h12e) ^ in[93];
  assign d_o[94] = (syndrome_o == 9'h9d) ^ in[94];
  assign d_o[95] = (syndrome_o == 9'hf1) ^ in[95];
  assign d_o[96] = (syndrome_o == 9'h1c6) ^ in[96];
  assign d_o[97] = (syndrome_o == 9'h5e) ^ in[97];
  assign d_o[98] = (syndrome_o == 9'h12d) ^ in[98];
  assign d_o[99] = (syndrome_o == 9'h174) ^ in[99];
  assign d_o[100] = (syndrome_o == 9'h1aa) ^ in[100];
  assign d_o[101] = (syndrome_o == 9'hab) ^ in[101];
  assign d_o[102] = (syndrome_o == 9'h165) ^ in[102];
  assign d_o[103] = (syndrome_o == 9'h73) ^ in[103];
  assign d_o[104] = (syndrome_o == 9'h15c) ^ in[104];
  assign d_o[105] = (syndrome_o == 9'h12b) ^ in[105];
  assign d_o[106] = (syndrome_o == 9'h1a3) ^ in[106];
  assign d_o[107] = (syndrome_o == 9'hf8) ^ in[107];
  assign d_o[108] = (syndrome_o == 9'h18b) ^ in[108];
  assign d_o[109] = (syndrome_o == 9'h1cc) ^ in[109];
  assign d_o[110] = (syndrome_o == 9'h97) ^ in[110];
  assign d_o[111] = (syndrome_o == 9'h1d1) ^ in[111];
  assign d_o[112] = (syndrome_o == 9'hf4) ^ in[112];
  assign d_o[113] = (syndrome_o == 9'h1c5) ^ in[113];
  assign d_o[114] = (syndrome_o == 9'h1a5) ^ in[114];
  assign d_o[115] = (syndrome_o == 9'hf2) ^ in[115];
  assign d_o[116] = (syndrome_o == 9'h11e) ^ in[116];
  assign d_o[117] = (syndrome_o == 9'h136) ^ in[117];
  assign d_o[118] = (syndrome_o == 9'hae) ^ in[118];
  assign d_o[119] = (syndrome_o == 9'h159) ^ in[119];
  assign d_o[120] = (syndrome_o == 9'hd6) ^ in[120];
  assign d_o[121] = (syndrome_o == 9'h5b) ^ in[121];
  assign d_o[122] = (syndrome_o == 9'h6e) ^ in[122];
  assign d_o[123] = (syndrome_o == 9'h171) ^ in[123];
  assign d_o[124] = (syndrome_o == 9'h57) ^ in[124];
  assign d_o[125] = (syndrome_o == 9'hb3) ^ in[125];
  assign d_o[126] = (syndrome_o == 9'ha7) ^ in[126];
  assign d_o[127] = (syndrome_o == 9'h1e8) ^ in[127];

  // err_o calc. bit0: single error, bit1: double error
  assign single_error = ^syndrome_o;
  assign err_o[0] =  single_error;
  assign err_o[1] = ~single_error & (|syndrome_o);
endmodule
