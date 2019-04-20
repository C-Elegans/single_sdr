package singlesdr

import spinal.core._
import spinal.lib._

case class Complex(width:BitCount) extends Bundle {
  val i = SInt(width)
  val q = SInt(width)
}

class IQDecimator extends Component {
  val widthin = 10 bits
  val widthout = 18 bits
  val coeffs = Array(
    -0.00566096,
    0.13265074,
    0.27096242,
    0.34009388,
    0.27096242,
    0.13265074,
    -0.00566096
  )
  val io = new Bundle {
    val cpx_in = in(Complex(widthin))
    val cpx_out = out(Complex(widthout))
  }

  val delayline = Reg(Vec(Complex(widthout), coeffs.length))
  for (i <- 1 to coeffs.length - 1) {
    delayline(i) := delayline(i-1)
  }
  delayline(0).i := io.cpx_in.i.resized
  delayline(0).q := io.cpx_in.q.resized
  io.cpx_out := delayline(coeffs.length - 1)
}
