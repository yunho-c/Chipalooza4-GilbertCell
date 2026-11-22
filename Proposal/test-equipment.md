# Georgia Tech equipment planning reference

Internal working note, reviewed November 21, 2026. The measurement plan is in [sections/05-verification.tex](sections/05-verification.tex). This note replaces `test-equipment.tex`; it is not a submission-ready equipment attachment for [Chipalooza Rule 6.6](https://opencircuitdesign.com/chipalooza/rules-4.html).

Public listings confirm listed equipment, not team access, reservations, calibration, installed options, accessories, or simultaneous availability. These need checking before committing to measurements.

The proposal now uses differential RF (`RF_P`/`RF_N`, two dedicated pads), single-ended LO (one dedicated pad with an on-chip balun), and shared IF. The RF reference is 100 Ω differential. A single-ended RF generator therefore also needs an external balun or verified differential fixture; availability is unconfirmed. All three dedicated pads are used, so adding a dedicated IF requires revising the allocation or an approved resource exception.

## The Hive: all 21 listed benchtop entries

Each instrument name links to the facility's availability listing, rather than implying that a manufacturer's product page proves local availability.

| Listed equipment | Potential project use / limitation |
| --- | --- |
| [Keysight E5063A][hive] | Differential RF matching via calibrated two-port data/mixed-mode conversion; installed 900 MHz coverage and calibration kit unconfirmed. |
| [Keysight N9000B][hive] | IF spectra and RF/LO leakage; check coupling, noise floor, calibration, and IF loading. |
| [Keysight vector signal generator][hive] | Candidate RF or LO source; model, frequency coverage, options, source count, and simultaneous availability unspecified. This is not evidence that 900 MHz generation is unavailable. |
| [Keysight N1913A][hive] | RF power calibration; compatible power sensor unconfirmed. |
| [Keysight E4980-AL (inventory spelling)][hive] | Passive-component impedance checks within its supported range. |
| [Tektronix MSO58][hive] | IF waveform, startup, and control checks with suitable probes. |
| [Keysight DSOX3014A][hive] | IF waveforms and transients. |
| [Keysight DSOX4024A][hive] | IF waveforms and transients. |
| [Keysight DSOX6002A][hive] | IF waveforms; direct RF probing needs bandwidth/loading verification. |
| [Tektronix AFG31152][hive] | IF/fixture stimulus; 150 MHz sine limit, not a 900 MHz source. |
| [Keysight 33500B family][hive] | IF/fixture stimulus; exact 20/30 MHz model unspecified, not a 900 MHz source. |
| [Keithley 2450][hive] | DC sourcing and sweeps, subject to harness supply isolation. |
| [Keithley DMM6500][hive] | DC voltage/current. |
| [Keysight 34460A][hive] | DC voltage/current. |
| [Keithley 2281S-20-6][hive] | Programmable supply and supply-sensitivity checks. |
| [Keithley 2230-30-1][hive] | Supply and bias rails. |
| [Keysight U8031A][hive] | Supply and bias rails. |
| [Keysight E3630A][hive] | Supply and bias rails within its available ranges. |
| [Aoyue 932][hive] | Component pickup. |
| [Weller WXR3][hive] | Soldering/desoldering. |
| [Quick 957DW+][hive] | Hot-air rework. |

Station checkout also lists tweezers, cutters, and screwdrivers.

## Invention Studio: electronics and fixture fabrication

The [tools directory](https://inventionstudio.gatech.edu/tools-equipment/) covers electronics and fabrication groups, including CNC, laser cutting, waterjet, metal/wood shops, and 3D printing. These may support fixtures and boards.

| Equipment listed on the electronics page | Potential project use / limitation |
| --- | --- |
| [Keysight mixed-signal oscilloscope][studio] | Listed 500 MHz bandwidth, 5 GSa/s, four analog and 16 digital channels; suitable candidate for 5–20 MHz IF. |
| [Keysight arbitrary function generator][studio] | Listed 1 GSa/s and 64 MSa; model/output bandwidth unspecified. Sample rate does not establish 900 MHz generation. |
| [Fluke 179 multimeters][studio] | DC checks. |
| [Power supplies and RLC meter][studio] | Supplies/passive checks; models unspecified. |
| [Microscope][studio] | Assembly inspection. |
| [Weller stations, hot-air station, reflow oven, preheater][studio] | Assembly/rework; not a calibrated powered-DUT temperature-sweep setup. |
| [PCB mill][studio] | Two-layer boards, up to 12 × 12 inches; RF fixture quality still needs validation. |

The page lists three electronics workstations, precision hand tools, and common consumables. It does not establish additional independent 900 MHz sources or a complete noise-figure setup.

## Campus coverage

The [Georgia Tech makerspace directory](https://experiential.learning.gatech.edu/innovation/makerspaces/) lists nine facilities. Public capability pages for all nine were reviewed; this is a campus-level screening, not a complete inventory of unpublished equipment.

| Facility / source | Relevant finding |
| --- | --- |
| [The Hive][hive] | RF/IF and DC candidates above. |
| [Flowers Invention Studio][studio] | Electronics and fabrication resources above. |
| [The MILL: measurement](https://mill.mse.gatech.edu/equipment/measurement-team/) | [FLIR ETS320 infrared camera](https://mill.mse.gatech.edu/equipment/measurement-team/) can image surface heat. Calorimetry, TGA, and electrochemical impedance instruments do not establish live RF temperature-sweep capability. |
| [The MILL: characterization](https://mill.mse.gatech.edu/equipment/characterization-team/) / [processing](https://mill.mse.gatech.edu/equipment/processing-team/) | Microscopy/materials analysis and fabrication; ovens/furnaces are not evidence of a calibrated powered-DUT chamber. |
| [Yang Aero Maker Space](https://ae.gatech.edu/yang-aero-maker-space-ams) | Fabrication/composites resources, including a curing oven; no additional RF test setup established. |
| [BME Design Shop](https://bmemakerspaces.com/) | Fabrication and electronics resources; public pages did not establish additional RF instrument models. Linked by the GT shop site. |
| [College of Design Shop](https://id.gatech.edu/maker-resources) | Fixture fabrication; access restrictions apply to design students. |
| [ADC XR](https://xr.isye.gatech.edu/equipment/) | XR, scanning, and robotics resources; no mixer bench established. |
| [AI Makerspace](https://coe.gatech.edu/academics/ai-for-engineering/ai-makerspace) | Computing resources; no mixer bench established. |
| [IPaT Innovation Labs](https://labs.ipat.gatech.edu/) | Prototyping/e-textiles and related resources; no additional RF measurement setup established. |

## Measurement readiness and open work

| Measurement | Assessment from reviewed public information |
| --- | --- |
| Ambient DC, startup, IF waveforms | Suitable instrument classes are listed. Confirm probes, board connections, training, and access; mixer-only power measurement depends on supply isolation. |
| Gain/shared IF response, 5–20 MHz; LO leakage | Receiver/scope candidates exist. Independent calibrated RF/LO stimulus, external RF balun or differential source, accessories, and simultaneous access remain unconfirmed: further consideration required. |
| Differential RF input matching at 900 MHz | E5063A option 205 stops at 500 MHz; option 215 or higher is needed. Installed option/two-port calibration kit unconfirmed: further consideration required. |
| Two-tone IIP3 | Two RF tones plus independent LO, combining/isolation, and source purity not established: further consideration required. |
| Calibrated SSB noise figure | Noise source or equivalent calibrated method, IF receiver suitability, receiver-noise/image-band/fixture corrections not established: further consideration required. |
| Temperature sweeps | Controlled powered-DUT stage/chamber and monitoring not established. FLIR surface images alone are insufficient: further consideration required. Required post-layout PVT simulations remain in scope. |

For the high-impedance IF specification, any 50 Ω analyzer connection needs a characterized interface/loading correction. Report unmeasured specifications honestly; explore collaboration for unresolved setups rather than treating public listings as proof of capability.

Manufacturer references for capability checks: [E5063A options](https://helpfiles.keysight.com/csg/e5063a/product_information/options.htm), [AFG31000](https://www.tek.com/en/datasheet/arbitrary-function-generators), [33500B](https://www.keysight.com/content/dam/keysight/en/doc/ungate/product-fact-sheets/5991-0757.pdf), [N9000B specifications](https://www.keysight.com/us/en/assets/9018-04781/technical-specifications/9018-04781.pdf).

[hive]: https://wiki.hivemakerspace.com/explore/electronics-benchtop/
[studio]: https://inventionstudio.gatech.edu/tools-equipment/electronics/
