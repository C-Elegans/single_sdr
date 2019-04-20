package singlesdr

import spinal.core._
import spinal.lib._
import spinal.sim._
import spinal.core.sim._
import scala.math._

class Top extends Component {
  val io = new Bundle {
    val real_in = in SInt(10 bits)
    val complex_i = out SInt(18 bits)
    val complex_q = out SInt(18 bits)
  }

  val realtoiq = new RealToIQ(10 bits)
  io <> realtoiq.io

}

object TopVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new Top)
    SimConfig.withWave.doSim(new Top) { dut =>
      dut.clockDomain.forkStimulus(period = 10)
      for(i <- 0 to 256) {
        dut.io.real_in #= round(511 * sin(2*3.1415* 24e6/100e6 * i))
        dut.clockDomain.waitRisingEdge()
      }
    }
  }
}
