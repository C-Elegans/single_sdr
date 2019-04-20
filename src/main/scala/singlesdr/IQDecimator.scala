package singlesdr

import spinal.core._
import spinal.lib._
import scala.math._

case class Complex(width:BitCount) extends Bundle {
  val i = SInt(width)
  val q = SInt(width)
}

class IQDecimator extends Component {
  val widthin = 10 bits
  val widthout = 18 bits
  val coeffs = Array[Float](
    -0.00566096f,
    0.13265074f,
    0.27096242f,
    0.34009388f,
    0.27096242f,
    0.13265074f,
    -0.00566096f
  )
  val io = new Bundle {
    val cpx_in = in(Complex(widthin))
    val cpx_out = out(Complex(widthout))
  }

  val delayline = Reg(Vec(Complex(widthin), coeffs.length)) 
  for (i <- 1 to coeffs.length - 1) {
    delayline(i).i init(0)
    delayline(i).q init(0)
    delayline(i) := delayline(i-1)
  }
  delayline(0).i := io.cpx_in.i.resized
  delayline(0).q := io.cpx_in.q.resized
  io.cpx_out.q := delayline(coeffs.length - 1).q.resized

  val mult_out = Vec(SInt(widthout), coeffs.length/2 + 1)
  val sum = Vec(SInt(widthin + (1 bits)), coeffs.length/2 + 1)
  for ( i <- 0 to coeffs.length/2 ) {
    if(i == coeffs.length/2)
      sum(i) := delayline(i).i.resized
    else {
      sum(i) := delayline(i).i.resize(11 bits) + delayline(coeffs.length-1 - i).i.resize(11 bits)
      printf("adding delayline(%d) and delayline(%d)\n", i, coeffs.length-1-i)
    }

    mult_out(i) := (sum(i).resized * S(round(coeffs(i) * 256.0))).resized
  }

  io.cpx_out.i := mult_out(0) + mult_out(1) + mult_out(2) + mult_out(3)



}
