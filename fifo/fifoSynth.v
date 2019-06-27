/* Generated by Yosys 0.8 (git sha1 UNKNOWN, clang 6.0.0-1ubuntu2 -fPIC -Os) */

module RAM_memorySynth(clk, read, write, reset_L, data_in, wr_ptr, rd_ptr, data_out);
  wire [3:0] _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  wire _196_;
  wire _197_;
  wire _198_;
  wire _199_;
  wire _200_;
  wire _201_;
  wire _202_;
  wire _203_;
  wire _204_;
  wire _205_;
  wire _206_;
  wire _207_;
  wire _208_;
  wire _209_;
  wire _210_;
  wire _211_;
  wire _212_;
  wire _213_;
  wire _214_;
  wire _215_;
  wire _216_;
  wire _217_;
  wire _218_;
  wire _219_;
  wire _220_;
  wire _221_;
  wire _222_;
  wire _223_;
  wire _224_;
  wire _225_;
  wire _226_;
  wire _227_;
  wire _228_;
  wire _229_;
  wire _230_;
  wire _231_;
  wire _232_;
  wire _233_;
  wire _234_;
  wire _235_;
  wire _236_;
  wire _237_;
  wire _238_;
  wire _239_;
  wire _240_;
  wire _241_;
  wire _242_;
  wire _243_;
  wire _244_;
  wire _245_;
  input clk;
  input [3:0] data_in;
  output [3:0] data_out;
  wire [3:0] \ram_mem[0] ;
  wire [3:0] \ram_mem[1] ;
  wire [3:0] \ram_mem[2] ;
  wire [3:0] \ram_mem[3] ;
  wire [3:0] \ram_mem[4] ;
  wire [3:0] \ram_mem[5] ;
  wire [3:0] \ram_mem[6] ;
  wire [3:0] \ram_mem[7] ;
  input [2:0] rd_ptr;
  input read;
  input reset_L;
  input [2:0] wr_ptr;
  input write;
  NOT _246_ (
    .A(rd_ptr[0]),
    .Y(_231_)
  );
  NOT _247_ (
    .A(rd_ptr[1]),
    .Y(_232_)
  );
  NOT _248_ (
    .A(rd_ptr[2]),
    .Y(_233_)
  );
  NOT _249_ (
    .A(write),
    .Y(_234_)
  );
  NOT _250_ (
    .A(reset_L),
    .Y(_236_)
  );
  NOT _251_ (
    .A(data_in[0]),
    .Y(_237_)
  );
  NOT _252_ (
    .A(data_in[1]),
    .Y(_238_)
  );
  NOT _253_ (
    .A(data_in[2]),
    .Y(_239_)
  );
  NOT _254_ (
    .A(data_in[3]),
    .Y(_240_)
  );
  NOT _255_ (
    .A(wr_ptr[0]),
    .Y(_241_)
  );
  NOT _256_ (
    .A(wr_ptr[1]),
    .Y(_242_)
  );
  NOT _257_ (
    .A(wr_ptr[2]),
    .Y(_243_)
  );
  NOT _258_ (
    .A(read),
    .Y(_244_)
  );
  NOR _259_ (
    .A(_234_),
    .B(_236_),
    .Y(_245_)
  );
  NAND _260_ (
    .A(write),
    .B(reset_L),
    .Y(_001_)
  );
  NAND _261_ (
    .A(wr_ptr[1]),
    .B(_243_),
    .Y(_002_)
  );
  NOR _262_ (
    .A(_242_),
    .B(_001_),
    .Y(_003_)
  );
  NOR _263_ (
    .A(_001_),
    .B(_002_),
    .Y(_004_)
  );
  NAND _264_ (
    .A(_243_),
    .B(_003_),
    .Y(_005_)
  );
  NOR _265_ (
    .A(_241_),
    .B(_005_),
    .Y(_006_)
  );
  NAND _266_ (
    .A(wr_ptr[0]),
    .B(_004_),
    .Y(_007_)
  );
  NAND _267_ (
    .A(\ram_mem[3] [1]),
    .B(_007_),
    .Y(_008_)
  );
  NOR _268_ (
    .A(_238_),
    .B(_001_),
    .Y(_009_)
  );
  NAND _269_ (
    .A(_006_),
    .B(_009_),
    .Y(_010_)
  );
  NAND _270_ (
    .A(_008_),
    .B(_010_),
    .Y(_192_)
  );
  NAND _271_ (
    .A(\ram_mem[3] [2]),
    .B(_007_),
    .Y(_011_)
  );
  NOR _272_ (
    .A(_239_),
    .B(_001_),
    .Y(_012_)
  );
  NAND _273_ (
    .A(_006_),
    .B(_012_),
    .Y(_013_)
  );
  NAND _274_ (
    .A(_011_),
    .B(_013_),
    .Y(_230_)
  );
  NAND _275_ (
    .A(\ram_mem[3] [3]),
    .B(_007_),
    .Y(_014_)
  );
  NOR _276_ (
    .A(_240_),
    .B(_001_),
    .Y(_015_)
  );
  NAND _277_ (
    .A(_006_),
    .B(_015_),
    .Y(_016_)
  );
  NAND _278_ (
    .A(_014_),
    .B(_016_),
    .Y(_235_)
  );
  NOR _279_ (
    .A(wr_ptr[0]),
    .B(_005_),
    .Y(_017_)
  );
  NAND _280_ (
    .A(_241_),
    .B(_004_),
    .Y(_018_)
  );
  NAND _281_ (
    .A(\ram_mem[2] [0]),
    .B(_018_),
    .Y(_019_)
  );
  NOR _282_ (
    .A(_237_),
    .B(_001_),
    .Y(_020_)
  );
  NAND _283_ (
    .A(_017_),
    .B(_020_),
    .Y(_021_)
  );
  NAND _284_ (
    .A(_019_),
    .B(_021_),
    .Y(_026_)
  );
  NAND _285_ (
    .A(\ram_mem[2] [1]),
    .B(_018_),
    .Y(_022_)
  );
  NAND _286_ (
    .A(_009_),
    .B(_017_),
    .Y(_023_)
  );
  NAND _287_ (
    .A(_022_),
    .B(_023_),
    .Y(_051_)
  );
  NAND _288_ (
    .A(\ram_mem[2] [2]),
    .B(_018_),
    .Y(_024_)
  );
  NAND _289_ (
    .A(_012_),
    .B(_017_),
    .Y(_025_)
  );
  NAND _290_ (
    .A(_024_),
    .B(_025_),
    .Y(_067_)
  );
  NAND _291_ (
    .A(\ram_mem[2] [3]),
    .B(_018_),
    .Y(_027_)
  );
  NAND _292_ (
    .A(_015_),
    .B(_017_),
    .Y(_029_)
  );
  NAND _293_ (
    .A(_027_),
    .B(_029_),
    .Y(_083_)
  );
  NOR _294_ (
    .A(_243_),
    .B(_001_),
    .Y(_032_)
  );
  NAND _295_ (
    .A(wr_ptr[2]),
    .B(_245_),
    .Y(_034_)
  );
  NOR _296_ (
    .A(wr_ptr[1]),
    .B(_034_),
    .Y(_035_)
  );
  NAND _297_ (
    .A(_242_),
    .B(_032_),
    .Y(_037_)
  );
  NOR _298_ (
    .A(_241_),
    .B(_037_),
    .Y(_039_)
  );
  NAND _299_ (
    .A(wr_ptr[0]),
    .B(_035_),
    .Y(_041_)
  );
  NAND _300_ (
    .A(\ram_mem[5] [0]),
    .B(_041_),
    .Y(_043_)
  );
  NAND _301_ (
    .A(_020_),
    .B(_039_),
    .Y(_044_)
  );
  NAND _302_ (
    .A(_043_),
    .B(_044_),
    .Y(_111_)
  );
  NAND _303_ (
    .A(\ram_mem[5] [1]),
    .B(_041_),
    .Y(_045_)
  );
  NAND _304_ (
    .A(_009_),
    .B(_039_),
    .Y(_047_)
  );
  NAND _305_ (
    .A(_045_),
    .B(_047_),
    .Y(_131_)
  );
  NAND _306_ (
    .A(\ram_mem[5] [2]),
    .B(_041_),
    .Y(_048_)
  );
  NAND _307_ (
    .A(_012_),
    .B(_039_),
    .Y(_049_)
  );
  NAND _308_ (
    .A(_048_),
    .B(_049_),
    .Y(_151_)
  );
  NAND _309_ (
    .A(\ram_mem[5] [3]),
    .B(_041_),
    .Y(_050_)
  );
  NAND _310_ (
    .A(_015_),
    .B(_039_),
    .Y(_052_)
  );
  NAND _311_ (
    .A(_050_),
    .B(_052_),
    .Y(_171_)
  );
  NAND _312_ (
    .A(_242_),
    .B(_243_),
    .Y(_053_)
  );
  NOR _313_ (
    .A(wr_ptr[2]),
    .B(_001_),
    .Y(_054_)
  );
  NOR _314_ (
    .A(_001_),
    .B(_053_),
    .Y(_055_)
  );
  NAND _315_ (
    .A(_242_),
    .B(_054_),
    .Y(_056_)
  );
  NOR _316_ (
    .A(_241_),
    .B(_056_),
    .Y(_057_)
  );
  NAND _317_ (
    .A(wr_ptr[0]),
    .B(_055_),
    .Y(_058_)
  );
  NAND _318_ (
    .A(data_in[0]),
    .B(_057_),
    .Y(_059_)
  );
  NAND _319_ (
    .A(\ram_mem[1] [0]),
    .B(_058_),
    .Y(_060_)
  );
  NAND _320_ (
    .A(_059_),
    .B(_060_),
    .Y(_201_)
  );
  NAND _321_ (
    .A(data_in[1]),
    .B(_057_),
    .Y(_061_)
  );
  NAND _322_ (
    .A(\ram_mem[1] [1]),
    .B(_058_),
    .Y(_062_)
  );
  NAND _323_ (
    .A(_061_),
    .B(_062_),
    .Y(_216_)
  );
  NAND _324_ (
    .A(data_in[2]),
    .B(_057_),
    .Y(_063_)
  );
  NAND _325_ (
    .A(\ram_mem[1] [2]),
    .B(_058_),
    .Y(_064_)
  );
  NAND _326_ (
    .A(_063_),
    .B(_064_),
    .Y(_220_)
  );
  NAND _327_ (
    .A(data_in[3]),
    .B(_057_),
    .Y(_065_)
  );
  NAND _328_ (
    .A(\ram_mem[1] [3]),
    .B(_058_),
    .Y(_066_)
  );
  NAND _329_ (
    .A(_065_),
    .B(_066_),
    .Y(_221_)
  );
  NOR _330_ (
    .A(wr_ptr[0]),
    .B(_037_),
    .Y(_068_)
  );
  NAND _331_ (
    .A(_241_),
    .B(_035_),
    .Y(_069_)
  );
  NAND _332_ (
    .A(\ram_mem[4] [0]),
    .B(_069_),
    .Y(_070_)
  );
  NAND _333_ (
    .A(_020_),
    .B(_068_),
    .Y(_071_)
  );
  NAND _334_ (
    .A(_070_),
    .B(_071_),
    .Y(_222_)
  );
  NAND _335_ (
    .A(\ram_mem[4] [1]),
    .B(_069_),
    .Y(_072_)
  );
  NAND _336_ (
    .A(_009_),
    .B(_068_),
    .Y(_073_)
  );
  NAND _337_ (
    .A(_072_),
    .B(_073_),
    .Y(_223_)
  );
  NAND _338_ (
    .A(\ram_mem[4] [2]),
    .B(_069_),
    .Y(_074_)
  );
  NAND _339_ (
    .A(_012_),
    .B(_068_),
    .Y(_075_)
  );
  NAND _340_ (
    .A(_074_),
    .B(_075_),
    .Y(_224_)
  );
  NAND _341_ (
    .A(\ram_mem[4] [3]),
    .B(_069_),
    .Y(_076_)
  );
  NAND _342_ (
    .A(_015_),
    .B(_068_),
    .Y(_077_)
  );
  NAND _343_ (
    .A(_076_),
    .B(_077_),
    .Y(_225_)
  );
  NOR _344_ (
    .A(wr_ptr[0]),
    .B(_056_),
    .Y(_078_)
  );
  NAND _345_ (
    .A(_241_),
    .B(_055_),
    .Y(_079_)
  );
  NAND _346_ (
    .A(data_in[0]),
    .B(_078_),
    .Y(_080_)
  );
  NAND _347_ (
    .A(\ram_mem[0] [0]),
    .B(_079_),
    .Y(_081_)
  );
  NAND _348_ (
    .A(_080_),
    .B(_081_),
    .Y(_226_)
  );
  NAND _349_ (
    .A(data_in[1]),
    .B(_078_),
    .Y(_082_)
  );
  NAND _350_ (
    .A(\ram_mem[0] [1]),
    .B(_079_),
    .Y(_084_)
  );
  NAND _351_ (
    .A(_082_),
    .B(_084_),
    .Y(_227_)
  );
  NAND _352_ (
    .A(data_in[2]),
    .B(_078_),
    .Y(_085_)
  );
  NAND _353_ (
    .A(\ram_mem[0] [2]),
    .B(_079_),
    .Y(_086_)
  );
  NAND _354_ (
    .A(_085_),
    .B(_086_),
    .Y(_228_)
  );
  NAND _355_ (
    .A(data_in[3]),
    .B(_078_),
    .Y(_087_)
  );
  NAND _356_ (
    .A(\ram_mem[0] [3]),
    .B(_079_),
    .Y(_088_)
  );
  NAND _357_ (
    .A(_087_),
    .B(_088_),
    .Y(_229_)
  );
  NOR _358_ (
    .A(\ram_mem[7] [0]),
    .B(_231_),
    .Y(_089_)
  );
  NOR _359_ (
    .A(\ram_mem[6] [0]),
    .B(rd_ptr[0]),
    .Y(_090_)
  );
  NOR _360_ (
    .A(_089_),
    .B(_090_),
    .Y(_091_)
  );
  NOR _361_ (
    .A(_232_),
    .B(_091_),
    .Y(_092_)
  );
  NOR _362_ (
    .A(\ram_mem[5] [0]),
    .B(_231_),
    .Y(_093_)
  );
  NOR _363_ (
    .A(\ram_mem[4] [0]),
    .B(rd_ptr[0]),
    .Y(_094_)
  );
  NOR _364_ (
    .A(_093_),
    .B(_094_),
    .Y(_095_)
  );
  NOR _365_ (
    .A(rd_ptr[1]),
    .B(_095_),
    .Y(_096_)
  );
  NOR _366_ (
    .A(_092_),
    .B(_096_),
    .Y(_097_)
  );
  NOR _367_ (
    .A(_233_),
    .B(_097_),
    .Y(_098_)
  );
  NOR _368_ (
    .A(_231_),
    .B(\ram_mem[3] [0]),
    .Y(_099_)
  );
  NOR _369_ (
    .A(\ram_mem[2] [0]),
    .B(rd_ptr[0]),
    .Y(_100_)
  );
  NOR _370_ (
    .A(_099_),
    .B(_100_),
    .Y(_101_)
  );
  NOR _371_ (
    .A(_232_),
    .B(_101_),
    .Y(_102_)
  );
  NOR _372_ (
    .A(\ram_mem[1] [0]),
    .B(_231_),
    .Y(_103_)
  );
  NOR _373_ (
    .A(\ram_mem[0] [0]),
    .B(rd_ptr[0]),
    .Y(_104_)
  );
  NOR _374_ (
    .A(_103_),
    .B(_104_),
    .Y(_105_)
  );
  NOR _375_ (
    .A(rd_ptr[1]),
    .B(_105_),
    .Y(_106_)
  );
  NOR _376_ (
    .A(_102_),
    .B(_106_),
    .Y(_107_)
  );
  NOR _377_ (
    .A(rd_ptr[2]),
    .B(_107_),
    .Y(_108_)
  );
  NOR _378_ (
    .A(_098_),
    .B(_108_),
    .Y(_109_)
  );
  NOR _379_ (
    .A(_244_),
    .B(_109_),
    .Y(_110_)
  );
  NOR _380_ (
    .A(data_out[0]),
    .B(read),
    .Y(_112_)
  );
  NOT _381_ (
    .A(_112_),
    .Y(_113_)
  );
  NAND _382_ (
    .A(reset_L),
    .B(_113_),
    .Y(_114_)
  );
  NOR _383_ (
    .A(_110_),
    .B(_114_),
    .Y(_000_[0])
  );
  NOR _384_ (
    .A(_231_),
    .B(\ram_mem[7] [1]),
    .Y(_115_)
  );
  NOR _385_ (
    .A(rd_ptr[0]),
    .B(\ram_mem[6] [1]),
    .Y(_116_)
  );
  NOR _386_ (
    .A(_115_),
    .B(_116_),
    .Y(_117_)
  );
  NOR _387_ (
    .A(_232_),
    .B(_117_),
    .Y(_118_)
  );
  NOR _388_ (
    .A(\ram_mem[5] [1]),
    .B(_231_),
    .Y(_119_)
  );
  NOR _389_ (
    .A(\ram_mem[4] [1]),
    .B(rd_ptr[0]),
    .Y(_120_)
  );
  NOR _390_ (
    .A(_119_),
    .B(_120_),
    .Y(_121_)
  );
  NOR _391_ (
    .A(rd_ptr[1]),
    .B(_121_),
    .Y(_122_)
  );
  NOR _392_ (
    .A(_118_),
    .B(_122_),
    .Y(_123_)
  );
  NOR _393_ (
    .A(_233_),
    .B(_123_),
    .Y(_124_)
  );
  NOR _394_ (
    .A(\ram_mem[3] [1]),
    .B(_231_),
    .Y(_125_)
  );
  NOR _395_ (
    .A(\ram_mem[2] [1]),
    .B(rd_ptr[0]),
    .Y(_126_)
  );
  NOR _396_ (
    .A(_125_),
    .B(_126_),
    .Y(_127_)
  );
  NOR _397_ (
    .A(_232_),
    .B(_127_),
    .Y(_128_)
  );
  NOR _398_ (
    .A(\ram_mem[1] [1]),
    .B(_231_),
    .Y(_129_)
  );
  NOR _399_ (
    .A(\ram_mem[0] [1]),
    .B(rd_ptr[0]),
    .Y(_130_)
  );
  NOR _400_ (
    .A(_129_),
    .B(_130_),
    .Y(_132_)
  );
  NOR _401_ (
    .A(rd_ptr[1]),
    .B(_132_),
    .Y(_133_)
  );
  NOR _402_ (
    .A(_128_),
    .B(_133_),
    .Y(_134_)
  );
  NOR _403_ (
    .A(rd_ptr[2]),
    .B(_134_),
    .Y(_135_)
  );
  NOR _404_ (
    .A(_124_),
    .B(_135_),
    .Y(_136_)
  );
  NOR _405_ (
    .A(_244_),
    .B(_136_),
    .Y(_137_)
  );
  NOR _406_ (
    .A(read),
    .B(data_out[1]),
    .Y(_138_)
  );
  NOT _407_ (
    .A(_138_),
    .Y(_139_)
  );
  NAND _408_ (
    .A(reset_L),
    .B(_139_),
    .Y(_140_)
  );
  NOR _409_ (
    .A(_137_),
    .B(_140_),
    .Y(_000_[1])
  );
  NOR _410_ (
    .A(_231_),
    .B(\ram_mem[7] [2]),
    .Y(_141_)
  );
  NOR _411_ (
    .A(rd_ptr[0]),
    .B(\ram_mem[6] [2]),
    .Y(_142_)
  );
  NOR _412_ (
    .A(_141_),
    .B(_142_),
    .Y(_143_)
  );
  NOR _413_ (
    .A(_232_),
    .B(_143_),
    .Y(_144_)
  );
  NOR _414_ (
    .A(\ram_mem[5] [2]),
    .B(_231_),
    .Y(_145_)
  );
  NOR _415_ (
    .A(\ram_mem[4] [2]),
    .B(rd_ptr[0]),
    .Y(_146_)
  );
  NOR _416_ (
    .A(_145_),
    .B(_146_),
    .Y(_147_)
  );
  NOR _417_ (
    .A(rd_ptr[1]),
    .B(_147_),
    .Y(_148_)
  );
  NOR _418_ (
    .A(_144_),
    .B(_148_),
    .Y(_149_)
  );
  NOR _419_ (
    .A(_233_),
    .B(_149_),
    .Y(_150_)
  );
  NOR _420_ (
    .A(\ram_mem[3] [2]),
    .B(_231_),
    .Y(_152_)
  );
  NOR _421_ (
    .A(\ram_mem[2] [2]),
    .B(rd_ptr[0]),
    .Y(_153_)
  );
  NOR _422_ (
    .A(_152_),
    .B(_153_),
    .Y(_154_)
  );
  NOR _423_ (
    .A(_232_),
    .B(_154_),
    .Y(_155_)
  );
  NOR _424_ (
    .A(\ram_mem[1] [2]),
    .B(_231_),
    .Y(_156_)
  );
  NOR _425_ (
    .A(\ram_mem[0] [2]),
    .B(rd_ptr[0]),
    .Y(_157_)
  );
  NOR _426_ (
    .A(_156_),
    .B(_157_),
    .Y(_158_)
  );
  NOR _427_ (
    .A(rd_ptr[1]),
    .B(_158_),
    .Y(_159_)
  );
  NOR _428_ (
    .A(_155_),
    .B(_159_),
    .Y(_160_)
  );
  NOR _429_ (
    .A(rd_ptr[2]),
    .B(_160_),
    .Y(_161_)
  );
  NOR _430_ (
    .A(_150_),
    .B(_161_),
    .Y(_162_)
  );
  NOR _431_ (
    .A(_244_),
    .B(_162_),
    .Y(_163_)
  );
  NOR _432_ (
    .A(read),
    .B(data_out[2]),
    .Y(_164_)
  );
  NOT _433_ (
    .A(_164_),
    .Y(_165_)
  );
  NAND _434_ (
    .A(reset_L),
    .B(_165_),
    .Y(_166_)
  );
  NOR _435_ (
    .A(_163_),
    .B(_166_),
    .Y(_000_[2])
  );
  NOR _436_ (
    .A(_231_),
    .B(\ram_mem[7] [3]),
    .Y(_167_)
  );
  NOR _437_ (
    .A(rd_ptr[0]),
    .B(\ram_mem[6] [3]),
    .Y(_168_)
  );
  NOR _438_ (
    .A(_167_),
    .B(_168_),
    .Y(_169_)
  );
  NOR _439_ (
    .A(_232_),
    .B(_169_),
    .Y(_170_)
  );
  NOR _440_ (
    .A(\ram_mem[5] [3]),
    .B(_231_),
    .Y(_172_)
  );
  NOR _441_ (
    .A(\ram_mem[4] [3]),
    .B(rd_ptr[0]),
    .Y(_173_)
  );
  NOR _442_ (
    .A(_172_),
    .B(_173_),
    .Y(_174_)
  );
  NOR _443_ (
    .A(rd_ptr[1]),
    .B(_174_),
    .Y(_175_)
  );
  NOR _444_ (
    .A(_170_),
    .B(_175_),
    .Y(_176_)
  );
  NOR _445_ (
    .A(_233_),
    .B(_176_),
    .Y(_177_)
  );
  NOR _446_ (
    .A(\ram_mem[3] [3]),
    .B(_231_),
    .Y(_178_)
  );
  NOR _447_ (
    .A(\ram_mem[2] [3]),
    .B(rd_ptr[0]),
    .Y(_179_)
  );
  NOR _448_ (
    .A(_178_),
    .B(_179_),
    .Y(_180_)
  );
  NOR _449_ (
    .A(_232_),
    .B(_180_),
    .Y(_181_)
  );
  NOR _450_ (
    .A(\ram_mem[1] [3]),
    .B(_231_),
    .Y(_182_)
  );
  NOR _451_ (
    .A(\ram_mem[0] [3]),
    .B(rd_ptr[0]),
    .Y(_183_)
  );
  NOR _452_ (
    .A(_182_),
    .B(_183_),
    .Y(_184_)
  );
  NOR _453_ (
    .A(rd_ptr[1]),
    .B(_184_),
    .Y(_185_)
  );
  NOR _454_ (
    .A(_181_),
    .B(_185_),
    .Y(_186_)
  );
  NOR _455_ (
    .A(rd_ptr[2]),
    .B(_186_),
    .Y(_187_)
  );
  NOR _456_ (
    .A(_177_),
    .B(_187_),
    .Y(_188_)
  );
  NOR _457_ (
    .A(_244_),
    .B(_188_),
    .Y(_189_)
  );
  NOR _458_ (
    .A(read),
    .B(data_out[3]),
    .Y(_190_)
  );
  NOT _459_ (
    .A(_190_),
    .Y(_191_)
  );
  NAND _460_ (
    .A(reset_L),
    .B(_191_),
    .Y(_193_)
  );
  NOR _461_ (
    .A(_189_),
    .B(_193_),
    .Y(_000_[3])
  );
  NOR _462_ (
    .A(_242_),
    .B(_034_),
    .Y(_194_)
  );
  NAND _463_ (
    .A(wr_ptr[1]),
    .B(_032_),
    .Y(_195_)
  );
  NOR _464_ (
    .A(wr_ptr[0]),
    .B(_195_),
    .Y(_196_)
  );
  NAND _465_ (
    .A(_241_),
    .B(_194_),
    .Y(_197_)
  );
  NAND _466_ (
    .A(\ram_mem[6] [0]),
    .B(_197_),
    .Y(_198_)
  );
  NAND _467_ (
    .A(_020_),
    .B(_196_),
    .Y(_199_)
  );
  NAND _468_ (
    .A(_198_),
    .B(_199_),
    .Y(_028_)
  );
  NAND _469_ (
    .A(\ram_mem[6] [1]),
    .B(_197_),
    .Y(_200_)
  );
  NAND _470_ (
    .A(_009_),
    .B(_196_),
    .Y(_202_)
  );
  NAND _471_ (
    .A(_200_),
    .B(_202_),
    .Y(_030_)
  );
  NAND _472_ (
    .A(\ram_mem[6] [2]),
    .B(_197_),
    .Y(_203_)
  );
  NAND _473_ (
    .A(_012_),
    .B(_196_),
    .Y(_204_)
  );
  NAND _474_ (
    .A(_203_),
    .B(_204_),
    .Y(_031_)
  );
  NAND _475_ (
    .A(\ram_mem[6] [3]),
    .B(_197_),
    .Y(_205_)
  );
  NAND _476_ (
    .A(_015_),
    .B(_196_),
    .Y(_206_)
  );
  NAND _477_ (
    .A(_205_),
    .B(_206_),
    .Y(_033_)
  );
  NOR _478_ (
    .A(_241_),
    .B(_195_),
    .Y(_207_)
  );
  NAND _479_ (
    .A(wr_ptr[0]),
    .B(_194_),
    .Y(_208_)
  );
  NAND _480_ (
    .A(\ram_mem[7] [0]),
    .B(_208_),
    .Y(_209_)
  );
  NAND _481_ (
    .A(_020_),
    .B(_207_),
    .Y(_210_)
  );
  NAND _482_ (
    .A(_209_),
    .B(_210_),
    .Y(_036_)
  );
  NAND _483_ (
    .A(\ram_mem[7] [1]),
    .B(_208_),
    .Y(_211_)
  );
  NAND _484_ (
    .A(_009_),
    .B(_207_),
    .Y(_212_)
  );
  NAND _485_ (
    .A(_211_),
    .B(_212_),
    .Y(_038_)
  );
  NAND _486_ (
    .A(\ram_mem[7] [2]),
    .B(_208_),
    .Y(_213_)
  );
  NAND _487_ (
    .A(_012_),
    .B(_207_),
    .Y(_214_)
  );
  NAND _488_ (
    .A(_213_),
    .B(_214_),
    .Y(_040_)
  );
  NAND _489_ (
    .A(\ram_mem[7] [3]),
    .B(_208_),
    .Y(_215_)
  );
  NAND _490_ (
    .A(_015_),
    .B(_207_),
    .Y(_217_)
  );
  NAND _491_ (
    .A(_215_),
    .B(_217_),
    .Y(_042_)
  );
  NAND _492_ (
    .A(\ram_mem[3] [0]),
    .B(_007_),
    .Y(_218_)
  );
  NAND _493_ (
    .A(_006_),
    .B(_020_),
    .Y(_219_)
  );
  NAND _494_ (
    .A(_218_),
    .B(_219_),
    .Y(_046_)
  );
  DFF _495_ (
    .C(clk),
    .D(_226_),
    .Q(\ram_mem[0] [0])
  );
  DFF _496_ (
    .C(clk),
    .D(_227_),
    .Q(\ram_mem[0] [1])
  );
  DFF _497_ (
    .C(clk),
    .D(_228_),
    .Q(\ram_mem[0] [2])
  );
  DFF _498_ (
    .C(clk),
    .D(_229_),
    .Q(\ram_mem[0] [3])
  );
  DFF _499_ (
    .C(clk),
    .D(_201_),
    .Q(\ram_mem[1] [0])
  );
  DFF _500_ (
    .C(clk),
    .D(_216_),
    .Q(\ram_mem[1] [1])
  );
  DFF _501_ (
    .C(clk),
    .D(_220_),
    .Q(\ram_mem[1] [2])
  );
  DFF _502_ (
    .C(clk),
    .D(_221_),
    .Q(\ram_mem[1] [3])
  );
  DFF _503_ (
    .C(clk),
    .D(_028_),
    .Q(\ram_mem[6] [0])
  );
  DFF _504_ (
    .C(clk),
    .D(_030_),
    .Q(\ram_mem[6] [1])
  );
  DFF _505_ (
    .C(clk),
    .D(_031_),
    .Q(\ram_mem[6] [2])
  );
  DFF _506_ (
    .C(clk),
    .D(_033_),
    .Q(\ram_mem[6] [3])
  );
  DFF _507_ (
    .C(clk),
    .D(_036_),
    .Q(\ram_mem[7] [0])
  );
  DFF _508_ (
    .C(clk),
    .D(_038_),
    .Q(\ram_mem[7] [1])
  );
  DFF _509_ (
    .C(clk),
    .D(_040_),
    .Q(\ram_mem[7] [2])
  );
  DFF _510_ (
    .C(clk),
    .D(_042_),
    .Q(\ram_mem[7] [3])
  );
  DFF _511_ (
    .C(clk),
    .D(_111_),
    .Q(\ram_mem[5] [0])
  );
  DFF _512_ (
    .C(clk),
    .D(_131_),
    .Q(\ram_mem[5] [1])
  );
  DFF _513_ (
    .C(clk),
    .D(_151_),
    .Q(\ram_mem[5] [2])
  );
  DFF _514_ (
    .C(clk),
    .D(_171_),
    .Q(\ram_mem[5] [3])
  );
  DFF _515_ (
    .C(clk),
    .D(_222_),
    .Q(\ram_mem[4] [0])
  );
  DFF _516_ (
    .C(clk),
    .D(_223_),
    .Q(\ram_mem[4] [1])
  );
  DFF _517_ (
    .C(clk),
    .D(_224_),
    .Q(\ram_mem[4] [2])
  );
  DFF _518_ (
    .C(clk),
    .D(_225_),
    .Q(\ram_mem[4] [3])
  );
  DFF _519_ (
    .C(clk),
    .D(_046_),
    .Q(\ram_mem[3] [0])
  );
  DFF _520_ (
    .C(clk),
    .D(_192_),
    .Q(\ram_mem[3] [1])
  );
  DFF _521_ (
    .C(clk),
    .D(_230_),
    .Q(\ram_mem[3] [2])
  );
  DFF _522_ (
    .C(clk),
    .D(_235_),
    .Q(\ram_mem[3] [3])
  );
  DFF _523_ (
    .C(clk),
    .D(_026_),
    .Q(\ram_mem[2] [0])
  );
  DFF _524_ (
    .C(clk),
    .D(_051_),
    .Q(\ram_mem[2] [1])
  );
  DFF _525_ (
    .C(clk),
    .D(_067_),
    .Q(\ram_mem[2] [2])
  );
  DFF _526_ (
    .C(clk),
    .D(_083_),
    .Q(\ram_mem[2] [3])
  );
  DFF _527_ (
    .C(clk),
    .D(_000_[0]),
    .Q(data_out[0])
  );
  DFF _528_ (
    .C(clk),
    .D(_000_[1]),
    .Q(data_out[1])
  );
  DFF _529_ (
    .C(clk),
    .D(_000_[2]),
    .Q(data_out[2])
  );
  DFF _530_ (
    .C(clk),
    .D(_000_[3]),
    .Q(data_out[3])
  );
endmodule

module fifoSynth(clk, reset_L, read, write, buff_in, umb_almost_full, umb_almost_empty, almost_full_estruct, almost_empty_estruct, fifo_full_estruct, fifo_empty_estruct, data_count_estruct, buffer_out_estruct, error_estruct);
  wire [3:0] _000_;
  wire [3:0] _001_;
  wire [2:0] _002_;
  wire [2:0] _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  output almost_empty_estruct;
  output almost_full_estruct;
  input [3:0] buff_in;
  output [3:0] buffer_out_estruct;
  input clk;
  output [3:0] data_count_estruct;
  wire [3:0] data_out;
  output error_estruct;
  output fifo_empty_estruct;
  output fifo_full_estruct;
  wire [2:0] rd_ptr;
  input read;
  input reset_L;
  input [3:0] umb_almost_empty;
  input [3:0] umb_almost_full;
  wire [2:0] wr_ptr;
  input write;
  wire write_i;
  NOT _129_ (
    .A(data_count_estruct[0]),
    .Y(_085_)
  );
  NOT _130_ (
    .A(data_count_estruct[1]),
    .Y(_086_)
  );
  NOT _131_ (
    .A(data_count_estruct[2]),
    .Y(_087_)
  );
  NOT _132_ (
    .A(data_count_estruct[3]),
    .Y(_088_)
  );
  NOT _133_ (
    .A(write_i),
    .Y(_089_)
  );
  NOT _134_ (
    .A(reset_L),
    .Y(_090_)
  );
  NOT _135_ (
    .A(data_out[0]),
    .Y(_091_)
  );
  NOT _136_ (
    .A(data_out[1]),
    .Y(_092_)
  );
  NOT _137_ (
    .A(data_out[2]),
    .Y(_093_)
  );
  NOT _138_ (
    .A(data_out[3]),
    .Y(_094_)
  );
  NOT _139_ (
    .A(rd_ptr[0]),
    .Y(_095_)
  );
  NOT _140_ (
    .A(rd_ptr[2]),
    .Y(_096_)
  );
  NOT _141_ (
    .A(wr_ptr[0]),
    .Y(_097_)
  );
  NOT _142_ (
    .A(wr_ptr[2]),
    .Y(_098_)
  );
  NOT _143_ (
    .A(umb_almost_full[1]),
    .Y(_099_)
  );
  NOT _144_ (
    .A(umb_almost_full[2]),
    .Y(_100_)
  );
  NOT _145_ (
    .A(umb_almost_empty[3]),
    .Y(_101_)
  );
  NOR _146_ (
    .A(_085_),
    .B(_086_),
    .Y(_102_)
  );
  NAND _147_ (
    .A(data_count_estruct[0]),
    .B(data_count_estruct[1]),
    .Y(_103_)
  );
  NOR _148_ (
    .A(_087_),
    .B(_103_),
    .Y(_104_)
  );
  NAND _149_ (
    .A(data_count_estruct[3]),
    .B(reset_L),
    .Y(_105_)
  );
  NOT _150_ (
    .A(_105_),
    .Y(_106_)
  );
  NAND _151_ (
    .A(_104_),
    .B(_106_),
    .Y(_107_)
  );
  NOT _152_ (
    .A(_107_),
    .Y(fifo_full_estruct)
  );
  NOR _153_ (
    .A(data_count_estruct[0]),
    .B(data_count_estruct[1]),
    .Y(_108_)
  );
  NAND _154_ (
    .A(_087_),
    .B(_108_),
    .Y(_109_)
  );
  NOR _155_ (
    .A(data_count_estruct[3]),
    .B(_109_),
    .Y(_110_)
  );
  NOR _156_ (
    .A(_090_),
    .B(_110_),
    .Y(_111_)
  );
  NOT _157_ (
    .A(_111_),
    .Y(fifo_empty_estruct)
  );
  NAND _158_ (
    .A(write),
    .B(reset_L),
    .Y(_112_)
  );
  NOT _159_ (
    .A(_112_),
    .Y(_004_)
  );
  NAND _160_ (
    .A(read),
    .B(reset_L),
    .Y(_113_)
  );
  NOT _161_ (
    .A(_113_),
    .Y(_114_)
  );
  NOR _162_ (
    .A(_110_),
    .B(_113_),
    .Y(_115_)
  );
  NAND _163_ (
    .A(read),
    .B(_111_),
    .Y(_116_)
  );
  NOR _164_ (
    .A(_089_),
    .B(fifo_full_estruct),
    .Y(_117_)
  );
  NAND _165_ (
    .A(write_i),
    .B(_107_),
    .Y(_118_)
  );
  NOR _166_ (
    .A(_116_),
    .B(_117_),
    .Y(_119_)
  );
  NAND _167_ (
    .A(_115_),
    .B(_118_),
    .Y(_120_)
  );
  NOR _168_ (
    .A(buffer_out_estruct[0]),
    .B(_119_),
    .Y(_121_)
  );
  NAND _169_ (
    .A(_091_),
    .B(_119_),
    .Y(_122_)
  );
  NAND _170_ (
    .A(reset_L),
    .B(_122_),
    .Y(_123_)
  );
  NOR _171_ (
    .A(_121_),
    .B(_123_),
    .Y(_000_[0])
  );
  NOR _172_ (
    .A(buffer_out_estruct[1]),
    .B(_119_),
    .Y(_124_)
  );
  NAND _173_ (
    .A(_092_),
    .B(_119_),
    .Y(_125_)
  );
  NAND _174_ (
    .A(reset_L),
    .B(_125_),
    .Y(_126_)
  );
  NOR _175_ (
    .A(_124_),
    .B(_126_),
    .Y(_000_[1])
  );
  NOR _176_ (
    .A(buffer_out_estruct[2]),
    .B(_119_),
    .Y(_127_)
  );
  NAND _177_ (
    .A(_093_),
    .B(_119_),
    .Y(_128_)
  );
  NAND _178_ (
    .A(reset_L),
    .B(_128_),
    .Y(_005_)
  );
  NOR _179_ (
    .A(_127_),
    .B(_005_),
    .Y(_000_[2])
  );
  NOR _180_ (
    .A(buffer_out_estruct[3]),
    .B(_119_),
    .Y(_006_)
  );
  NAND _181_ (
    .A(_094_),
    .B(_119_),
    .Y(_007_)
  );
  NAND _182_ (
    .A(reset_L),
    .B(_007_),
    .Y(_008_)
  );
  NOR _183_ (
    .A(_006_),
    .B(_008_),
    .Y(_000_[3])
  );
  NOR _184_ (
    .A(_115_),
    .B(_118_),
    .Y(_009_)
  );
  NOR _185_ (
    .A(_119_),
    .B(_009_),
    .Y(_010_)
  );
  NOR _186_ (
    .A(_085_),
    .B(_010_),
    .Y(_011_)
  );
  NAND _187_ (
    .A(_085_),
    .B(_010_),
    .Y(_012_)
  );
  NAND _188_ (
    .A(reset_L),
    .B(_012_),
    .Y(_013_)
  );
  NOR _189_ (
    .A(_011_),
    .B(_013_),
    .Y(_001_[0])
  );
  NAND _190_ (
    .A(data_count_estruct[1]),
    .B(_010_),
    .Y(_014_)
  );
  NOR _191_ (
    .A(_102_),
    .B(_108_),
    .Y(_015_)
  );
  NOR _192_ (
    .A(_120_),
    .B(_015_),
    .Y(_016_)
  );
  NAND _193_ (
    .A(_009_),
    .B(_015_),
    .Y(_017_)
  );
  NOT _194_ (
    .A(_017_),
    .Y(_018_)
  );
  NOR _195_ (
    .A(_016_),
    .B(_018_),
    .Y(_019_)
  );
  NAND _196_ (
    .A(_014_),
    .B(_019_),
    .Y(_020_)
  );
  NAND _197_ (
    .A(reset_L),
    .B(_020_),
    .Y(_021_)
  );
  NOT _198_ (
    .A(_021_),
    .Y(_001_[1])
  );
  NAND _199_ (
    .A(_108_),
    .B(_119_),
    .Y(_022_)
  );
  NAND _200_ (
    .A(_102_),
    .B(_009_),
    .Y(_023_)
  );
  NAND _201_ (
    .A(_022_),
    .B(_023_),
    .Y(_024_)
  );
  NAND _202_ (
    .A(data_count_estruct[2]),
    .B(_024_),
    .Y(_025_)
  );
  NOR _203_ (
    .A(data_count_estruct[2]),
    .B(_024_),
    .Y(_026_)
  );
  NAND _204_ (
    .A(reset_L),
    .B(_025_),
    .Y(_027_)
  );
  NOR _205_ (
    .A(_026_),
    .B(_027_),
    .Y(_001_[2])
  );
  NOR _206_ (
    .A(_109_),
    .B(_113_),
    .Y(_028_)
  );
  NAND _207_ (
    .A(_118_),
    .B(_028_),
    .Y(_029_)
  );
  NAND _208_ (
    .A(data_count_estruct[3]),
    .B(_029_),
    .Y(_030_)
  );
  NAND _209_ (
    .A(_104_),
    .B(_009_),
    .Y(_031_)
  );
  NAND _210_ (
    .A(_030_),
    .B(_031_),
    .Y(_032_)
  );
  NAND _211_ (
    .A(reset_L),
    .B(_032_),
    .Y(_033_)
  );
  NOT _212_ (
    .A(_033_),
    .Y(_001_[3])
  );
  NOR _213_ (
    .A(_095_),
    .B(_116_),
    .Y(_034_)
  );
  NOR _214_ (
    .A(rd_ptr[0]),
    .B(_115_),
    .Y(_035_)
  );
  NOT _215_ (
    .A(_035_),
    .Y(_036_)
  );
  NAND _216_ (
    .A(reset_L),
    .B(_036_),
    .Y(_037_)
  );
  NOR _217_ (
    .A(_034_),
    .B(_037_),
    .Y(_002_[0])
  );
  NAND _218_ (
    .A(rd_ptr[1]),
    .B(_034_),
    .Y(_038_)
  );
  NOT _219_ (
    .A(_038_),
    .Y(_039_)
  );
  NOR _220_ (
    .A(rd_ptr[1]),
    .B(_034_),
    .Y(_040_)
  );
  NOT _221_ (
    .A(_040_),
    .Y(_041_)
  );
  NAND _222_ (
    .A(reset_L),
    .B(_041_),
    .Y(_042_)
  );
  NOR _223_ (
    .A(_039_),
    .B(_042_),
    .Y(_002_[1])
  );
  NOR _224_ (
    .A(_096_),
    .B(_038_),
    .Y(_043_)
  );
  NAND _225_ (
    .A(_096_),
    .B(_038_),
    .Y(_044_)
  );
  NAND _226_ (
    .A(reset_L),
    .B(_044_),
    .Y(_045_)
  );
  NOR _227_ (
    .A(_043_),
    .B(_045_),
    .Y(_002_[2])
  );
  NOR _228_ (
    .A(_097_),
    .B(_118_),
    .Y(_046_)
  );
  NAND _229_ (
    .A(_097_),
    .B(_118_),
    .Y(_047_)
  );
  NAND _230_ (
    .A(reset_L),
    .B(_047_),
    .Y(_048_)
  );
  NOR _231_ (
    .A(_046_),
    .B(_048_),
    .Y(_003_[0])
  );
  NAND _232_ (
    .A(wr_ptr[1]),
    .B(_046_),
    .Y(_049_)
  );
  NOT _233_ (
    .A(_049_),
    .Y(_050_)
  );
  NOR _234_ (
    .A(wr_ptr[1]),
    .B(_046_),
    .Y(_051_)
  );
  NOT _235_ (
    .A(_051_),
    .Y(_052_)
  );
  NAND _236_ (
    .A(reset_L),
    .B(_052_),
    .Y(_053_)
  );
  NOR _237_ (
    .A(_050_),
    .B(_053_),
    .Y(_003_[1])
  );
  NOR _238_ (
    .A(_098_),
    .B(_049_),
    .Y(_054_)
  );
  NAND _239_ (
    .A(_098_),
    .B(_049_),
    .Y(_055_)
  );
  NAND _240_ (
    .A(reset_L),
    .B(_055_),
    .Y(_056_)
  );
  NOR _241_ (
    .A(_054_),
    .B(_056_),
    .Y(_003_[2])
  );
  NAND _242_ (
    .A(_086_),
    .B(umb_almost_empty[1]),
    .Y(_057_)
  );
  NOR _243_ (
    .A(_085_),
    .B(umb_almost_empty[0]),
    .Y(_058_)
  );
  NAND _244_ (
    .A(_057_),
    .B(_058_),
    .Y(_059_)
  );
  NOR _245_ (
    .A(_087_),
    .B(umb_almost_empty[2]),
    .Y(_060_)
  );
  NOR _246_ (
    .A(_086_),
    .B(umb_almost_empty[1]),
    .Y(_061_)
  );
  NOR _247_ (
    .A(_060_),
    .B(_061_),
    .Y(_062_)
  );
  NAND _248_ (
    .A(_059_),
    .B(_062_),
    .Y(_063_)
  );
  NOR _249_ (
    .A(data_count_estruct[3]),
    .B(_101_),
    .Y(_064_)
  );
  NAND _250_ (
    .A(_087_),
    .B(umb_almost_empty[2]),
    .Y(_065_)
  );
  NAND _251_ (
    .A(_063_),
    .B(_065_),
    .Y(_066_)
  );
  NOR _252_ (
    .A(_064_),
    .B(_066_),
    .Y(_067_)
  );
  NAND _253_ (
    .A(data_count_estruct[3]),
    .B(_101_),
    .Y(_068_)
  );
  NAND _254_ (
    .A(_111_),
    .B(_068_),
    .Y(_069_)
  );
  NOR _255_ (
    .A(_067_),
    .B(_069_),
    .Y(almost_empty_estruct)
  );
  NOR _256_ (
    .A(_088_),
    .B(umb_almost_full[3]),
    .Y(_070_)
  );
  NOR _257_ (
    .A(data_count_estruct[2]),
    .B(_100_),
    .Y(_071_)
  );
  NOR _258_ (
    .A(_087_),
    .B(umb_almost_full[2]),
    .Y(_072_)
  );
  NOR _259_ (
    .A(data_count_estruct[1]),
    .B(_099_),
    .Y(_073_)
  );
  NAND _260_ (
    .A(_085_),
    .B(umb_almost_full[0]),
    .Y(_074_)
  );
  NOR _261_ (
    .A(_086_),
    .B(umb_almost_full[1]),
    .Y(_075_)
  );
  NOR _262_ (
    .A(_074_),
    .B(_075_),
    .Y(_076_)
  );
  NOR _263_ (
    .A(_073_),
    .B(_076_),
    .Y(_077_)
  );
  NOR _264_ (
    .A(_072_),
    .B(_077_),
    .Y(_078_)
  );
  NOR _265_ (
    .A(_071_),
    .B(_078_),
    .Y(_079_)
  );
  NOR _266_ (
    .A(_070_),
    .B(_079_),
    .Y(_080_)
  );
  NAND _267_ (
    .A(_088_),
    .B(umb_almost_full[3]),
    .Y(_081_)
  );
  NAND _268_ (
    .A(reset_L),
    .B(_081_),
    .Y(_082_)
  );
  NOR _269_ (
    .A(_080_),
    .B(_082_),
    .Y(almost_full_estruct)
  );
  NAND _270_ (
    .A(write_i),
    .B(fifo_full_estruct),
    .Y(_083_)
  );
  NAND _271_ (
    .A(_110_),
    .B(_114_),
    .Y(_084_)
  );
  NAND _272_ (
    .A(_083_),
    .B(_084_),
    .Y(error_estruct)
  );
  DFF _273_ (
    .C(clk),
    .D(_002_[0]),
    .Q(rd_ptr[0])
  );
  DFF _274_ (
    .C(clk),
    .D(_002_[1]),
    .Q(rd_ptr[1])
  );
  DFF _275_ (
    .C(clk),
    .D(_002_[2]),
    .Q(rd_ptr[2])
  );
  DFF _276_ (
    .C(clk),
    .D(_003_[0]),
    .Q(wr_ptr[0])
  );
  DFF _277_ (
    .C(clk),
    .D(_003_[1]),
    .Q(wr_ptr[1])
  );
  DFF _278_ (
    .C(clk),
    .D(_003_[2]),
    .Q(wr_ptr[2])
  );
  DFF _279_ (
    .C(clk),
    .D(_001_[0]),
    .Q(data_count_estruct[0])
  );
  DFF _280_ (
    .C(clk),
    .D(_001_[1]),
    .Q(data_count_estruct[1])
  );
  DFF _281_ (
    .C(clk),
    .D(_001_[2]),
    .Q(data_count_estruct[2])
  );
  DFF _282_ (
    .C(clk),
    .D(_001_[3]),
    .Q(data_count_estruct[3])
  );
  DFF _283_ (
    .C(clk),
    .D(_000_[0]),
    .Q(buffer_out_estruct[0])
  );
  DFF _284_ (
    .C(clk),
    .D(_000_[1]),
    .Q(buffer_out_estruct[1])
  );
  DFF _285_ (
    .C(clk),
    .D(_000_[2]),
    .Q(buffer_out_estruct[2])
  );
  DFF _286_ (
    .C(clk),
    .D(_000_[3]),
    .Q(buffer_out_estruct[3])
  );
  DFF _287_ (
    .C(clk),
    .D(_004_),
    .Q(write_i)
  );
  RAM_memorySynth mem0 (
    .clk(clk),
    .data_in(buff_in),
    .data_out(data_out),
    .rd_ptr(rd_ptr),
    .read(read),
    .reset_L(reset_L),
    .wr_ptr(wr_ptr),
    .write(write)
  );
endmodule
