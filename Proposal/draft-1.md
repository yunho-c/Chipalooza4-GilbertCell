# Proposal: 900 MHz Low-Power Gilbert-Cell Downconversion Mixer

**Chipalooza Challenge #4 — SkyWater SKY130 CMOS**

## 1. IP Block Type and Overview

This project proposes the design and implementation of a **900 MHz low-power active downconversion mixer** using the open-source SkyWater SKY130 CMOS process.

The proposed IP will use a double-balanced Gilbert-cell architecture to translate RF signals around 900 MHz to a low intermediate frequency (IF). It is intended as a reusable analog building block for wireless receivers, including IoT and other sub-GHz RF communication systems.

The primary objective is to provide a fully open-source, silicon-validated mixer IP with documented conversion gain, noise figure, linearity, port isolation, power consumption, and input impedance characteristics.

The baseline design will use fixed biasing. If development time permits, digitally programmable biasing will be added as an optional enhancement to investigate power–performance trade-offs.

## 2. Functional Description

The proposed mixer will consist of the following subcircuits:

1. **RF Transconductance Stage:** Converts the incoming RF voltage into a differential current for frequency conversion.
2. **Gilbert-Cell Switching Core:** Performs frequency translation using a differential LO switching pair.
3. **LO Input Interface:** Accepts an externally generated LO signal and provides the complementary signals required by the switching core.
4. **IF Load and Output Interface:** Converts the downconverted current into an IF voltage suitable for measurement or connection to a subsequent analog stage.
5. **Bias Circuitry:** Establishes the operating currents and bias points of the mixer.

The mixer will operate according to

\[
f_{\mathrm{IF}}=|f_{\mathrm{RF}}-f_{\mathrm{LO}}|.
\]

For example, an RF input at 900 MHz and an LO input at 899 MHz will produce a desired IF component at 1 MHz. % (?) 너무 낮지 않냐? 보통 ADC sampling rate

The design will target low power consumption while maintaining useful conversion gain, noise performance, and linearity.

Input impedance matching will be considered for compatibility with standard 50 Ω RF measurement equipment. The matching network will be designed and characterized together with the input circuitry and relevant pad parasitics.

## 3. I/O and Interface Requirements

The baseline design requests three dedicated analog signal pads.

| Signal | Direction | Description |
|---|---|---|
| RF_IN | Input | Single-ended RF input, nominally 900 MHz |
| LO_IN | Input | Single-ended external LO input |
| IF_OUT | Output | Buffered, single-ended low-frequency IF output |
| VDD / GND | Power | Supplied through the Chipalooza harness |
| ENABLE | Digital input | Mixer enable/power-down control, if available |

The mixer will internally generate the complementary signals necessary for Gilbert-cell operation.

**Pad requirements:** RF_IN and LO_IN require dedicated connections suitable for 900 MHz signaling. IF_OUT also requests a dedicated pad to simplify independent characterization. The final pad arrangement and compatibility with the SKY130 pad library will be confirmed during proposal and schematic review.

The baseline circuit will target a nominal 1.8 V core supply, subject to confirmation of harness supply availability, pad voltage limits, and required interface protection.

External RF and LO signal generators will be used for characterization; an on-chip PLL or LO frequency synthesizer is outside the scope of this proposal.

## 4. Preliminary Target Specifications

The following values are initial design targets rather than demonstrated performance. Final feasibility will be assessed through SKY130 transistor-level simulations and review of the RF pad interface.

| Parameter | Preliminary target |
|---|---|
| CMOS process | SkyWater SKY130 |
| RF operating region | Around 900 MHz |
| Nominal RF frequency | 900 MHz |
| IF test frequency | 0.5–5 MHz |
| Core supply voltage | 1.8 V nominal |
| Supply characterization | 1.62–1.98 V, subject to PDK limits |
| Conversion gain | ≥ 5 dB nominal; ≥ 0 dB minimum target |
| Single-sideband noise figure | ≤ 15 dB nominal target |
| Input return loss (S11) | ≤ −10 dB at nominal RF frequency |
| Input third-order intercept (IIP3) | ≥ −15 dBm nominal target |
| LO-to-RF isolation | ≥ 20 dB |
| DC power consumption | ≤ 20 mW nominal |
| Load for baseline IF testing | High-impedance measurement input |

Specifications will be evaluated under clearly defined RF input power, LO drive, load impedance, supply voltage, and temperature conditions. Transistor operating voltages and RF input levels will remain within the applicable PDK and pad absolute limits.

The design will be characterized across process, voltage, and temperature corners, including post-layout extracted parasitics. The acceptance limits and simulation methods will be finalized during schematic review with the challenge organizers.

## 5. Verification and Measurement Plan

The mixer will undergo pre-layout simulation, physical implementation, post-layout verification, and silicon characterization.

### Pre-Layout Verification

- Verify DC operating points and device operating regions.
- Evaluate conversion gain across RF frequency, LO drive, and bias conditions.
- Characterize RF input impedance and S11.
- Evaluate linearity using two-tone RF tests and estimate IIP3.
- Evaluate LO-to-RF feedthrough and port isolation.
- Analyze noise performance and power consumption.
- Perform process, voltage, temperature, and mismatch sensitivity analyses.

### Physical Design and Post-Layout Verification

The mixer will be laid out using the SKY130 PDK, with attention to differential symmetry, device matching, parasitic coupling, and RF signal routing.

Verification will include:

- Design Rule Check (DRC)
- Layout Versus Schematic (LVS)
- Parasitic extraction (PEX)
- Post-layout conversion gain, linearity, isolation, and power simulations
- PVT verification using reproducible open-source workflows

### Silicon Characterization

Following fabrication, RF and LO signals will be applied through the dedicated test pads.

The IF output will be measured using appropriate test equipment to characterize conversion gain, operating frequency range, and linearity.

A two-tone RF measurement will be used to determine third-order intermodulation performance. Input matching and LO leakage will be characterized using RF measurement equipment where available.

Noise figure will be characterized using a calibrated noise measurement method, with test-fixture and interface losses accounted for.

Measurements will be compared with pre-layout and post-layout simulation results, and any discrepancies will be documented.

## 6. Optional Enhancement: Programmable Bias

If the baseline mixer meets its target specifications and the design schedule permits, programmable bias circuitry will be incorporated.

This enhancement will allow selection among several operating bias points to investigate trade-offs between:

- Conversion gain
- Noise figure
- Third-order linearity
- DC power consumption

The implementation may use a digitally controlled current mirror or a switchable bias network.

**Programmable bias is not required for successful operation or verification of the baseline mixer.** The fixed-bias mixer will remain a standalone, reusable IP block.

## 7. Open-Source Deliverables

The project will be released under the Apache-2.0 license, subject to compatibility with all incorporated source materials.

The public repository will include:

- Transistor-level schematics and simulation testbenches
- Circuit documentation and design specifications
- Standalone layout and Chipalooza harness integration views
- DRC/LVS reports and parasitic extraction results
- Reproducible scripts for open-source EDA verification
- Post-layout simulation summaries
- Silicon measurement results following fabrication

The design will be developed and verified using the SKY130 open-source PDK, with reproducible verification through tools such as Xschem, ngspice, Magic, and/or KLayout as appropriate.

## 8. Project Scope and Schedule

The project will prioritize a complete baseline Gilbert-cell mixer over optional functionality.

| Milestone | Deliverable |
|---|---|
| Proposal review — Nov. 2026 | Architecture, target specifications, and I/O plan |
| Schematic review — Dec. 2026 | Complete circuit and pre-layout verification |
| Layout review — Feb. 2027 | Standalone layout, DRC/LVS, PEX and post-layout verification |
| Final review — Feb. 2027 | Harness integration and sign-off |
| Tapeout — May 2027 | Final open-source design submission |

The proposed scope is deliberately limited to a single RF downconversion mixer. A complete receiver, on-chip PLL, and automatic I/Q calibration are not included.

## 9. Expected Contribution

The project aims to provide an accessible, reusable, and silicon-characterized 900 MHz analog mixer IP in SKY130 CMOS.

Although the Gilbert-cell topology is well established, an openly documented implementation with reproducible verification and measured RF performance would provide a practical building block for educational, research, and open-source wireless SoC development.

The optional programmable-bias extension may further demonstrate how conversion gain, linearity, noise, and power consumption vary with operating conditions, helping future designers select appropriate configurations for their applications.
