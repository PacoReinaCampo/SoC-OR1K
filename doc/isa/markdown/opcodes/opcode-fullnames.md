## INSTRUCTION FULL NAMES

Format of a line in the table:

`<instruction name> "<instruction full name>"`

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `lui`        | `Load Upper Immediate`                                              |
| `auipc`      | `Add Upper Immediate to PC`                                         |
| `jal`        | `Jump and Link`                                                     |
| `jalr`       | `Jump and Link Register`                                            |
| `beq`        | `Branch Equal`                                                      |
| `bne`        | `Branch Not Equal`                                                  |
| `blt`        | `Branch Less Than`                                                  |
| `bge`        | `Branch Greater than Equal`                                         |
| `bltu`       | `Branch Less Than Unsigned`                                         |
| `bgeu`       | `Branch Greater than Equal Unsigned`                                |
| `lb`         | `Load Byte`                                                         |
| `lh`         | `Load Half`                                                         |
| `lw`         | `Load Word`                                                         |
| `lbu`        | `Load Byte Unsigned`                                                |
| `lhu`        | `Load Half Unsigned`                                                |
| `lwu`        | `Load Word Unsigned`                                                |
| `sb`         | `Store Byte`                                                        |
| `sh`         | `Store Half`                                                        |
| `sw`         | `Store Word`                                                        |
| `addi`       | `Add Immediate`                                                     |
| `slti`       | `Set Less Than Immediate`                                           |
| `sltiu`      | `Set Less Than Immediate Unsigned`                                  |
| `xori`       | `Xor Immediate`                                                     |
| `ori`        | `Or Immediate`                                                      |
| `andi`       | `And Immediate`                                                     |
| `slli`       | `Shift Left Logical Immediate`                                      |
| `srli`       | `Shift Right Logical Immediate`                                     |
| `srai`       | `Shift Right Arithmetic Immediate`                                  |
| `add`        | `Add`                                                               |
| `sub`        | `Subtract`                                                          |
| `sll`        | `Shift Left Logical`                                                |
| `slt`        | `Set Less Than`                                                     |
| `sltu`       | `Set Less Than Unsigned`                                            |
| `xor`        | `Xor`                                                               |
| `srl`        | `Shift Right Logical`                                               |
| `sra`        | `Shift Right Arithmetic`                                            |
| `or`         | `Or`                                                                |
| `and`        | `And`                                                               |
| `fence`      | `Fence`                                                             |
| `fence.i`    | `Fence Instruction`                                                 |

:RV32I - "RV32I Base Integer Instruction Set"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `ld`         | `Load Double`                                                       |
| `sd`         | `Store Double`                                                      |
| `addiw`      | `Add Immediate Word`                                                |
| `slliw`      | `Shift Left Logical Immediate Word`                                 |
| `srliw`      | `Shift Right Logical Immediate Word`                                |
| `sraiw`      | `Shift Right Arithmetic Immediate Word`                             |
| `addw`       | `Add Word`                                                          |
| `subw`       | `Subtract Word`                                                     |
| `sllw`       | `Shift Left Logical Word`                                           |
| `srlw`       | `Shift Right Logical Word`                                          |
| `sraw`       | `Shift Right Arithmetic Word`                                       |

:RV64I - "RV64I Base Integer Instruction Set (+ RV32I)"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `mul`        | `Multiply`                                                          |
| `mulh`       | `Multiply High Signed Signed`                                       |
| `mulhsu`     | `Multiply High Signed Unsigned`                                     |
| `mulhu`      | `Multiply High Unsigned Unsigned`                                   |
| `div`        | `Divide Signed`                                                     |
| `divu`       | `Divide Unsigned`                                                   |
| `rem`        | `Remainder Signed`                                                  |
| `remu`       | `Remainder Unsigned`                                                |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `mulw`       | `Multiple Word`                                                     |
| `divw`       | `Divide Signed Word`                                                |
| `divuw`      | `Divide Unsigned Word`                                              |
| `remw`       | `Remainder Signed Word`                                             |
| `remuw`      | `Remainder Unsigned Word`                                           |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `lr.w`       | `Load Reserved Word`                                                |
| `sc.w`       | `Store Conditional Word`                                            |
| `amoswap.w`  | `Atomic Swap Word`                                                  |
| `amoadd.w`   | `Atomic Add Word`                                                   |
| `amoxor.w`   | `Atomic Xor Word`                                                   |
| `amoor.w`    | `Atomic Or Word`                                                    |
| `amoand.w`   | `Atomic And Word`                                                   |
| `amomin.w`   | `Atomic Minimum Word`                                               |
| `amomax.w`   | `Atomic Maximum Word`                                               |
| `amominu.w`  | `Atomic Minimum Unsigned Word`                                      |
| `amomaxu.w`  | `Atomic Maximum Unsigned Word`                                      |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `lr.d`       | `Load Reserved Double Word`                                         |
| `sc.d`       | `Store Conditional Double Word`                                     |
| `amoswap.d`  | `Atomic Swap Double Word`                                           |
| `amoadd.d`   | `Atomic Add Double Word`                                            |
| `amoxor.d`   | `Atomic Xor Double Word`                                            |
| `amoor.d`    | `Atomic Or Double Word`                                             |
| `amoand.d`   | `Atomic And Double Word`                                            |
| `amomin.d`   | `Atomic Minimum Double Word`                                        |
| `amomax.d`   | `Atomic Maximum Double Word`                                        |
| `amominu.d`  | `Atomic Minimum Unsigned Double Word`                               |
| `amomaxu.d`  | `Atomic Maximum Unsigned Double Word`                               |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `ecall`      | `Environment Call`                                                  |
| `ebreak`     | `Environment Break to Debugger`                                     |
| `uret`       | `User Return`                                                       |
| `sret`       | `System Return`                                                     |
| `hret`       | `Hypervisor Return`                                                 |
| `mret`       | `Machine-Mode Return`                                               |
| `dret`       | `Debug-Mode Return`                                                 |
| `sfence.vm`  | `Supervisor Memory Management Fence`                                |
| `wfi`        | `Wait For Interrupt`                                                |
| `rdcycle`    | `Read Cycle Counter Status Register`                                |
| `rdtime`     | `Read Timer Status register`                                        |
| `rdinstret`  | `Read Instructions Retired Status Register`                         |
| `rdcycleh`   | `Read Cycle Counter Status Register (upper 32-bits on RV32)`        |
| `rdtimeh`    | `Read Timer Status register (upper 32-bits on RV32)`                |
| `rdinstreth` | `Read Instructions Retired Status Register (upper 32-bits on RV32)` |
| `csrrw`      | `CSR Atomic Read Write`                                             |
| `csrrs`      | `CSR Atomic Set Bit`                                                |
| `csrrc`      | `CSR Atomic Clear Bit`                                              |
| `csrrwi`     | `CSR Atomic Read Write Immediate`                                   |
| `csrrsi`     | `CSR Atomic Set Bit Immediate`                                      |
| `csrrci`     | `CSR Atomic Clear Bit Immediate`                                    |

:RV32S - "RV32S Standard Extension for Supervisor-level Instructions"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `flw`        | `FP Load (SP)`                                                      |
| `fsw`        | `FP Store (SP)`                                                     |
| `fmadd.s`    | `FP Fused Multiply Add (SP)`                                        |
| `fmsub.s`    | `FP Fused Multiply Subtract (SP)`                                   |
| `fnmadd.s`   | `FP Negate fused Multiply Add (SP)`                                 |
| `fnmsub.s`   | `FP Negate fused Multiply Subtract (SP)`                            |
| `fadd.s`     | `FP Add (SP)`                                                       |
| `fsub.s`     | `FP Subtract (SP)`                                                  |
| `fmul.s`     | `FP Multiply (SP)`                                                  |
| `fdiv.s`     | `FP Divide (SP)`                                                    |
| `fsgnj.s`    | `FP Sign-injection (SP)`                                            |
| `fsgnjn.s`   | `FP Sign-injection Negate (SP)`                                     |
| `fsgnjx.s`   | `FP Sign-injection Xor (SP)`                                        |
| `fmin.s`     | `FP Minimum (SP)`                                                   |
| `fmax.s`     | `FP Maximum (SP)`                                                   |
| `fsqrt.s`    | `FP Square Root (SP)`                                               |
| `fle.s`      | `FP Less Than Equal (SP)`                                           |
| `flt.s`      | `FP Less Than (SP)`                                                 |
| `feq.s`      | `FP Equal (SP)`                                                     |
| `fcvt.w.s`   | `FP Convert Float to Word (SP)`                                     |
| `fcvt.wu.s`  | `FP Convert Float to Word Unsigned (SP)`                            |
| `fcvt.s.w`   | `FP Convert Word to Float (SP)`                                     |
| `fcvt.s.wu`  | `FP Convert Word Unsigned to Float (SP)`                            |
| `fmv.x.s`    | `FP Move to Integer Register (SP)`                                  |
| `fclass.s`   | `FP Classify (SP)`                                                  |
| `fmv.s.x`    | `FP Move from Integer Register (SP)`                                |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `fcvt.l.s`   | `FP Convert Float to Double Word (SP)`                              |
| `fcvt.lu.s`  | `FP Convert Float to Double Word Unsigned (SP)`                     |
| `fcvt.s.l`   | `FP Convert Double Word to Float (SP)`                              |
| `fcvt.s.lu`  | `FP Convert Double Word Unsigned to Float (SP)`                     |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `fld`        | `FP Load (DP)`                                                      |
| `fsd`        | `FP Store (DP)`                                                     |
| `fmadd.d`    | `FP Fused Multiply Add (DP)`                                        |
| `fmsub.d`    | `FP Fused Multiply Subtract (DP)`                                   |
| `fnmadd.d`   | `FP Negate fused Multiply Add (DP)`                                 |
| `fnmsub.d`   | `FP Negate fused Multiply Subtract (DP)`                            |
| `fadd.d`     | `FP Add (DP)`                                                       |
| `fsub.d`     | `FP Subtract (DP)`                                                  |
| `fmul.d`     | `FP Multiply (DP)`                                                  |
| `fdiv.d`     | `FP Divide (DP)`                                                    |
| `fsgnj.d`    | `FP to Sign-injection (DP)`                                         |
| `fsgnjn.d`   | `FP to Sign-injection Negate (DP)`                                  |
| `fsgnjx.d`   | `FP to Sign-injection Xor (DP)`                                     |
| `fmin.d`     | `FP Minimum (DP)`                                                   |
| `fmax.d`     | `FP Maximum (DP)`                                                   |
| `fcvt.s.d`   | `FP Convert DP to SP`                                               |
| `fcvt.d.s`   | `FP Convert SP to DP`                                               |
| `fsqrt.d`    | `Floating Square Root (DP)`                                         |
| `fle.d`      | `FP Less Than Equal (DP)`                                           |
| `flt.d`      | `FP Less Than (DP)`                                                 |
| `feq.d`      | `FP Equal (DP)`                                                     |
| `fcvt.w.d`   | `FP Convert Float to Word (DP)`                                     |
| `fcvt.wu.d`  | `FP Convert Float to Word Unsigned (DP)`                            |
| `fcvt.d.w`   | `FP Convert Word to Float (DP)`                                     |
| `fcvt.d.wu`  | `FP Convert Word Unsigned to Float (DP)`                            |
| `fclass.d`   | `FP Classify (DP)`                                                  |

:RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `fcvt.l.d`   | `FP Convert Float to Double Word (DP)`                              |
| `fcvt.lu.d`  | `FP Convert Float to Double Word Unsigned (DP)`                     |
| `fmv.x.d`    | `FP Move to Integer Register (DP)`                                  |
| `fcvt.d.l`   | `FP Convert Double Word to Float (DP)`                              |
| `fcvt.d.lu`  | `FP Convert Double Word Unsigned Float (DP)`                        |
| `fmv.d.x`    | `FP Move from Integer Register (DP)`                                |

:RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (+ RV32D)"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `frcsr`      | `Read FP Control and Status Register`                               |
| `frrm`       | `Read FP Rounding Mode`                                             |
| `frflags`    | `Read FP Accrued Exception Flags`                                   |
| `fscsr`      | `Set FP Control and Status Register`                                |
| `fsrm`       | `Set FP Rounding Mode`                                              |
| `fsflags`    | `Set FP Accrued Exception Flags`                                    |
| `fsrmi`      | `Set FP Rounding Mode Immediate`                                    |
| `fsflagsi`   | `Set FP Accrued Exception Flags Immediate`                          |

:RV32FD - "RV32F and RV32D Common Floating-Point Instructions"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `flq`        | `FP Load (QP)`                                                      |
| `fsq`        | `FP Store (QP)`                                                     |
| `fmadd.q`    | `FP Fused Multiply Add (QP)`                                        |
| `fmsub.q`    | `FP Fused Multiply Subtract (QP)`                                   |
| `fnmadd.q`   | `FP Negate fused Multiply Add (QP)`                                 |
| `fnmsub.q`   | `FP Negate fused Multiply Subtract (QP)`                            |
| `fadd.q`     | `FP Add (QP)`                                                       |
| `fsub.q`     | `FP Subtract (QP)`                                                  |
| `fmul.q`     | `FP Multiply (QP)`                                                  |
| `fdiv.q`     | `FP Divide (QP)`                                                    |
| `fsgnj.q`    | `FP to Sign-injection (QP)`                                         |
| `fsgnjn.q`   | `FP to Sign-injection Negate (QP)`                                  |
| `fsgnjx.q`   | `FP to Sign-injection Xor (QP)`                                     |
| `fmin.q`     | `FP Minimum (QP)`                                                   |
| `fmax.q`     | `FP Maximum (QP)`                                                   |
| `fcvt.s.q`   | `FP Convert QP to SP`                                               |
| `fcvt.q.s`   | `FP Convert SP to QP`                                               |
| `fcvt.d.q`   | `FP Convert QP to DP`                                               |
| `fcvt.q.d`   | `FP Convert DP to QP`                                               |
| `fsqrt.q`    | `Floating Square Root (QP)`                                         |
| `fle.q`      | `FP Less Than Equal (QP)`                                           |
| `flt.q`      | `FP Less Than (QP)`                                                 |
| `feq.q`      | `FP Equal (QP)`                                                     |
| `fcvt.w.q`   | `FP Convert Float to Word (QP)`                                     |
| `fcvt.wu.q`  | `FP Convert Float to Word Unsigned (QP)`                            |
| `fcvt.q.w`   | `FP Convert Word to Float (QP)`                                     |
| `fcvt.q.wu`  | `FP Convert Word Unsigned to Float (QP)`                            |
| `fclass.q`   | `FP Classify (QP)`                                                  |

:RV32Q - "RV32Q Standard Extension for Quadruple-Precision Floating-Point"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `fcvt.l.q`   | `FP Convert Float to Double Word (QP)`                              |
| `fcvt.lu.q`  | `FP Convert Float to Double Word Unsigned (QP)`                     |
| `fcvt.q.l`   | `FP Convert Double Word to Float (QP)`                              |
| `fcvt.q.lu`  | `FP Convert Double Word Unsigned Float (QP)`                        |

:RV64Q - "RV64Q Standard Extension for Quadruple-Precision Floating-Point (+ RV32Q)"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `fmv.x.q`    | `FP Move to Integer Register (QP)`                                  |
| `fmv.q.x`    | `FP Move from Integer Register (QP)`                                |

:RV128Q - "RV128Q Standard Extension for Quadruple-Precision Floating-Point (+ RV64Q)"

| instruction  | instruction full name                                               |
|--------------|:--------------------------------------------------------------------|
| `nop`        | `No operation`                                                      |
| `#li`        | `Load immediate`                                                    |
| `mv`         | `Copy register`                                                     |
| `not`        | `One's complement`                                                  |
| `neg`        | `Two's complement`                                                  |
| `negw`       | `Two's complement Word`                                             |
| `sext.w`     | `Sign extend Word`                                                  |
| `seqz`       | `Set if = zero`                                                     |
| `snez`       | `Set if != zero`                                                    |
| `sltz`       | `Set if < zero`                                                     |
| `sgtz`       | `Set if > zero`                                                     |
| `fmv.s`      | `Single-precision move`                                             |
| `fabs.s`     | `Single-precision absolute value`                                   |
| `fneg.s`     | `Single-precision negate`                                           |
| `fmv.d`      | `Double-precision move`                                             |
| `fabs.d`     | `Double-precision absolute value`                                   |
| `fneg.d`     | `Double-precision negate`                                           |
| `fmv.q`      | `Quadruple-precision move`                                          |
| `fabs.q`     | `Quadruple-precision absolute value`                                |
| `fneg.q`     | `Quadruple-precision negate`                                        |
| `beqz`       | `Branch if = zero`                                                  |
| `bnez`       | `Branch if != zero`                                                 |
| `blez`       | `Branch if <= zero`                                                 |
| `bgez`       | `Branch if >= zero`                                                 |
| `bltz`       | `Branch if < zero`                                                  |
| `bgtz`       | `Branch if > zero`                                                  |
| `j`          | `Jump`                                                              |
| `jr`         | `Jump register`                                                     |
| `ret`        | `Return from subroutine`                                            |

:Pseudo Instructions
