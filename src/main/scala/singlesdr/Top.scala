package singlesdr

import spinal.core._
import spinal.lib._
import spinal.sim._
import spinal.core.sim._
import scala.math._

class Top extends Component {
  val io = new Bundle {
    val real_in = in SInt(10 bits)
    val complex_out = out(Complex(12 bits))
    val iq_en = out Bool
  }

  val realtoiq = new RealToIQ(10 bits, 12 bits)
  val myfft = new FFT
  realtoiq.io.real_in := io.real_in
  myfft.io.sample_in := realtoiq.io.complex_out
  myfft.io.en := realtoiq.io.iq_en
  io.complex_out := myfft.io.sample_out
  io.iq_en := myfft.io.output_en


}

object TopVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new Top)
    SimConfig.withWave.doSim(new Top) { dut =>
      dut.clockDomain.forkStimulus(period = 10)
      for(i <- 0 to 4096) {
        dut.io.real_in #= round(511 * sin(2*3.1415* 26e6/100e6 * i))
        dut.clockDomain.waitRisingEdge()
      }
    }
  }
}
