package singlesdr

import spinal.core._
import spinal.lib._

class RealToIQ(width: BitCount, widthout: BitCount) extends Component {
  val io = new Bundle {
    val real_in = in SInt(width)
    val complex_out = out(Complex(widthout))
    val iq_en = out(Bool)
  }
  val multiplier = new IQMultiplier(width)
  val decimator = new IQDecimator
  multiplier.io.real_in := io.real_in
  decimator.io.cpx_in.i := multiplier.io.complex_i
  decimator.io.cpx_in.q := multiplier.io.complex_q

  val preshift = Complex(18 bits)
  preshift := decimator.io.cpx_out

  io.complex_out.i := preshift.i >> (preshift.i.getWidth - widthout.value)
  io.complex_out.q := preshift.q >> (preshift.q.getWidth - widthout.value)
  io.iq_en := decimator.io.out_en
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
