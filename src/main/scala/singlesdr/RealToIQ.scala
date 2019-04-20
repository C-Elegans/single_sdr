package singlesdr

import spinal.core._
import spinal.lib._

class RealToIQ(width: BitCount) extends Component {
  val io = new Bundle {
    val real_in = in SInt(width)
    val complex_i = out SInt(18 bits)
    val complex_q = out SInt(18 bits)
  }
  val multiplier = new IQMultiplier(width)
  val decimator = new IQDecimator
  multiplier.io.real_in := io.real_in
  decimator.io.cpx_in.i := multiplier.io.complex_i
  decimator.io.cpx_in.q := multiplier.io.complex_q

  io.complex_i := decimator.io.cpx_out.i
  io.complex_q := decimator.io.cpx_out.q
}


class IQMultiplier(width: BitCount) extends Component {
  val io = new Bundle {
    val real_in = in SInt(width)
    val complex_i = out(Reg(SInt(width))) init(0)
    val complex_q = out(Reg(SInt(width))) init(0)
  }
  val accumulator = Reg(UInt(2 bits)) init(0)

  switch(accumulator) {
    is(0) {
      io.complex_i := io.real_in;
      io.complex_q := 0;
    }
    is(1) {
      io.complex_i := 0;
      io.complex_q := io.real_in;
    }
    is(2) {
      io.complex_i := -io.real_in;
      io.complex_q := 0;
    }
    is(3) {
      io.complex_i := 0;
      io.complex_q := -io.real_in;
    }
  }
  accumulator := accumulator + 1
}
