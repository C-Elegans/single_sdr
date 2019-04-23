package singlesdr

import spinal.core._
import spinal.lib._

class mult18x18_0c extends BlackBox {
  val io = new Bundle {
    val clk = in Bool
    val rst = in Bool
    val en = in Bool
    val A = in SInt(18 bits)
    val B = in SInt(18 bits)
    val O = out SInt(36 bits)
  }
  mapClockDomain(clock=io.clk, reset=io.rst)
  noIoPrefix()
  addRTLPath("mult18x18_0c.v")
  addRTLPath("MULT18X18D.v")
}

class mult18x18_1c extends BlackBox {
  val io = new Bundle {
    val clk = in Bool
    val rst = in Bool
    val en = in Bool
    val A = in SInt(18 bits)
    val B = in SInt(18 bits)
    val O = out SInt(36 bits)
  }
  mapClockDomain(clock=io.clk, reset=io.rst)
  noIoPrefix()
  addRTLPath("mult18x18_1c.v")
  addRTLPath("MULT18X18D.v")
}

class mult18x18_2c extends BlackBox {
  val io = new Bundle {
    val clk = in Bool
    val rst = in Bool
    val en = in Bool
    val A = in SInt(18 bits)
    val B = in SInt(18 bits)
    val O = out SInt(36 bits)
  }
  mapClockDomain(clock=io.clk, reset=io.rst)
  noIoPrefix()
  addRTLPath("mult18x18_2c.v")
  addRTLPath("MULT18X18D.v")
}

class mult18x18_3c extends BlackBox {
  val io = new Bundle {
    val clk = in Bool
    val rst = in Bool
    val en = in Bool
    val A = in SInt(18 bits)
    val B = in SInt(18 bits)
    val O = out SInt(36 bits)
  }
  mapClockDomain(clock=io.clk, reset=io.rst)
  noIoPrefix()
  addRTLPath("mult18x18_3c.v")
  addRTLPath("MULT18X18D.v")
}
