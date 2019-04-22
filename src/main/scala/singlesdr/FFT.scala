package singlesdr

import spinal.core._
import spinal.lib._

class fftmain extends BlackBox {
  val io = new Bundle {
    val i_clk = in Bool
    val i_reset = in Bool
    val i_ce = in Bool
    val i_sample = in Bits(24 bits)
    val o_result = out Bits(24 bits)
    val o_sync = out Bool
  }
  mapClockDomain(clock=io.i_clk, reset=io.i_reset)
  noIoPrefix()
  addRTLPath("dblclockfft/fft-core/fftmain.v")
  addRTLPath("dblclockfft/fft-core/fftstage.v")
  addRTLPath("dblclockfft/fft-core/qtrstage.v")
  addRTLPath("dblclockfft/fft-core/laststage.v")
  addRTLPath("dblclockfft/fft-core/bitreverse.v")
  addRTLPath("dblclockfft/fft-core/convround.v")
  addRTLPath("dblclockfft/fft-core/hwbfly.v")
  addRTLPath("dblclockfft/fft-core/")
}

class FFT extends Component {
  val io = new Bundle {
    val en = in Bool
    val sample_in = in(Complex(12 bits))
    val sample_out = out(Complex(12 bits))
    val output_en = out Bool
  }

  val internalfft = new fftmain
  internalfft.io.i_ce := io.en
  internalfft.io.i_sample := io.sample_in.i ## io.sample_in.q

  val complexvec = internalfft.io.o_result.subdivideIn(2 slices)

  io.sample_out.i := complexvec(0).asSInt
  io.sample_out.q := complexvec(1).asSInt
  io.output_en := internalfft.io.o_sync

}
