# Programming with C — Unit 1

## KES' Shroff College — B.Sc. Artificial Intelligence

**Class:** FY-BSC AI  
**Subject:** Programming with C  
**Faculty In-charge:** Dr. Kishor Mahajan  
**Student:** Vishal Prajapati  
**Roll Number:** `FDAI044-A`

[![Language: C](https://img.shields.io/badge/Language-C-A8B9CC?style=for-the-badge&logo=c&logoColor=white)](https://en.cppreference.com/w/c)
[![Unit: 1](https://img.shields.io/badge/Unit-1-2F75B5?style=for-the-badge)](https://github.com/codeXparadise/Assignments)
[![Status: Completed](https://img.shields.io/badge/Status-Completed-2E7D32?style=for-the-badge)](https://github.com/codeXparadise/Assignments)

---

## Unit Overview

This Unit 1 folder contains two menu-driven C programming assignments. Together, they demonstrate `switch`-based selection, `do-while` repetition, arithmetic operations, formatted input/output, validation, controlled termination, and state updates in a console environment.

| Assignment | Main concept | Folder | Documentation |
|---|---|---|---|
| Scientific Calculator | `switch` statement and arithmetic operations | [scientific calculator](./scientific%20calculator/) | [Open README](./scientific%20calculator/README.md) |
| ATM Transaction Simulation | `do-while` loop and `switch` statement | [atm simulation](./atm%20simulation/) | [Open README](./atm%20simulation/README.md) |

> Each assignment folder contains its own source code, professional documentation report, official flowchart, a dark-mode output screenshot for GitHub viewing, and a light-mode output screenshot embedded in the DOCX report for printing.

---

## Repository Structure

```text
C/
└── UNIT 1/
    ├── README.md
    │
    ├── scientific calculator/
    │   ├── README.md
    │   ├── scientific_calculator.c
    │   ├── Assignment_1_Scientific_Calculator.docx
    │   └── assets/
│       ├── calculator_flowchart.png
│       ├── calculator_output_dark.png
│       └── calculator_output_light.png
    │
    └── atm simulation/
        ├── README.md
        ├── atm_simulation.c
        ├── Assignment_2_ATM_Transaction_Simulation.docx
        └── assets/
            ├── atm_flowchart.png
            ├── atm_output_dark.png
            └── atm_output_light.png
```

## Assignment Navigation

### 1. Scientific Calculator

The calculator implements addition, subtraction, multiplication, division, modulus, power, and percentage operations. Its dedicated README includes the problem statement, objectives, algorithm, flowchart, test cases, compilation command, and verified output.

**Direct links:** [Assignment README](./scientific%20calculator/README.md) · [C source code](./scientific%20calculator/scientific_calculator.c) · [DOCX report](./scientific%20calculator/Assignment_1_Scientific_Calculator.docx)

### 2. ATM Transaction Simulation

The ATM simulation implements balance enquiry, deposit, withdrawal, and exit operations. It validates transaction amounts, prevents excessive withdrawals, and repeats the menu until the user selects Exit.

**Direct links:** [Assignment README](./atm%20simulation/README.md) · [C source code](./atm%20simulation/atm_simulation.c) · [DOCX report](./atm%20simulation/Assignment_2_ATM_Transaction_Simulation.docx)

## Common Verification

Both programs were compiled with GCC and tested using representative normal, invalid, and boundary-condition inputs. The assignment-specific README files provide the exact test coverage and output evidence.

| Verification area | Scientific Calculator | ATM Simulation |
|---|---:|---:|
| Menu selection | Yes | Yes |
| `switch` statement | Yes | Yes |
| `do-while` repetition | Yes | Yes |
| Invalid menu handling | Yes | Yes |
| Operation or transaction validation | Division/modulus checks | Amount and balance checks |
| Verified output screenshot | Yes | Yes |

## References

## Complete Reports

- [ATM Transaction Simulation report](./ATM%20Simulation/Assignment.pdf)
- [Scientific Calculator report](./Scientific%20Calculator/Assignment.pdf)

1. [C language and standard library reference — cppreference.com](https://en.cppreference.com/w/c)
2. [`switch` statement reference — cppreference.com](https://en.cppreference.com/w/c/language/switch)
3. [`do-while` loop reference — cppreference.com](https://en.cppreference.com/w/c/language/do)
4. [C mathematical functions reference — cppreference.com](https://en.cppreference.com/w/c/numeric/math)

---

**Maintained by Vishal Prajapati · FDAI044-A · FY-BSC AI**
