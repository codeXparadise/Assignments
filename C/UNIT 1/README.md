# Programming with C — Unit 1 Assignment Report

### Academic Laboratory & Assignment Documentation

---

## 📌 Student & Course Information

| Parameter              | Details                                      |
| :--------------------- | :------------------------------------------- |
| **Student Name**       | Vishal Prajapati                             |
| **Roll Number**        | FDAI044-A                                    |
| **Course Name**        | Programming with C                           |
| **Academic Unit**      | Unit 1: Control Structures & Decision Making |
| **Institution**        | KES' Shroff College                          |
| **Submission Date**    | September 1, 2026                            |
| **Repository Purpose** | GitHub Academic Assignment Submission        |

---

## 📑 Table of Contents

1. [General Introduction](#1-general-introduction)
2. [Assignment 1: Scientific Calculator Using Switch](#2-assignment-1-scientific-calculator-using-switch)
   - [2.1 Problem Statement](#21-problem-statement)
   - [2.2 Objectives](#22-objectives)
   - [2.3 Input and Output Specification](#23-input-and-output-specification)
   - [2.4 Algorithm](#24-algorithm)
   - [2.5 Program Logic & Control Flow](#25-program-logic--control-flow)
   - [2.6 Source Code](#26-source-code)
   - [2.7 Compilation & Execution Guide](#27-compilation--execution-guide)
   - [2.8 Execution Output & Terminal Logs](#28-execution-output--terminal-logs)
   - [2.9 Implementation Details & Architectural Decisions](#29-implementation-details--architectural-decisions)
   - [2.10 Test Cases & Verification Matrix](#210-test-cases--verification-matrix)
   - [2.11 Conclusion for Assignment 1](#211-conclusion-for-assignment-1)
3. [Assignment 2: ATM Transaction Simulation](#3-assignment-2-atm-transaction-simulation)
   - [3.1 Problem Statement](#31-problem-statement)
   - [3.2 Objectives](#32-objectives)
   - [3.3 Initial Assumptions & Menu Specification](#33-initial-assumptions--menu-specification)
   - [3.4 Algorithm](#34-algorithm)
   - [3.5 Program Logic & Control Flow](#35-program-logic--control-flow)
   - [3.6 Source Code](#36-source-code)
   - [3.7 Compilation & Execution Guide](#37-compilation--execution-guide)
   - [3.8 Execution Output & Terminal Logs](#38-execution-output--terminal-logs)
   - [3.9 Implementation Details & Transaction Safety](#39-implementation-details--transaction-safety)
   - [3.10 Test Cases & Verification Matrix](#310-test-cases--verification-matrix)
   - [3.11 Conclusion for Assignment 2](#311-conclusion-for-assignment-2)
4. [Overall Conclusion & Key Takeaways](#4-overall-conclusion--key-takeaways)
5. [References](#5-references)

---

## 1. General Introduction

This documentation covers two menu-driven C programs developed as part of the **Unit 1 Assignment for Programming with C**.

The programs focus on core procedural programming constructs, structured control flow, decision-making logic, iterative processing, and defensive input validation:

1. **Scientific Calculator**: Implements an arithmetic engine using a `switch` statement combined with a `do-while` loop for repeated menu execution.
2. **ATM Transaction Simulation**: Models essential retail banking operations (Balance Enquiry, Deposit, Withdrawal, Exit) using stateful balance tracking, defensive input sanitization, and structured conditional execution.

Both applications are built as clean, portable CLI programs ensuring adherence to standard ISO C practices, input buffer hygiene, and defensive handling of edge cases such as division by zero and negative financial transactions.

---

## 2. Assignment 1: Scientific Calculator Using Switch

### 2.1 Problem Statement

Design and implement an interactive, menu-driven scientific calculator in C that performs addition, subtraction, multiplication, division, modulus, power calculation, and percentage calculation. The program must:

- Use a `switch` statement as its primary control dispatch mechanism.
- Validate and reject mathematical edge cases (e.g., division by zero, modulus by zero).
- Handle non-numeric or out-of-range menu selections gracefully without crashing or entering infinite loops.
- Explain why the `switch` statement is structurally preferable over an `if-else-if` ladder for discrete menu architectures.

### 2.2 Objectives

- Implement menu selection via multi-branch `switch` control structures.
- Select appropriate data representations (`double` for real arithmetic, `int` for integer modulus).
- Link external mathematical libraries (`math.h` and `-lm` flag for power computations).
- Implement robust input buffer clearing (`getchar()` discard loop) to prevent buffer poisoning from malformed inputs.
- Enable repeated calculations in a single execution session until the user explicitly signals exit.

### 2.3 Input and Output Specification

| Option | Operation          | Input Type Required                       | Output Description                                                         |
| :----: | :----------------- | :---------------------------------------- | :------------------------------------------------------------------------- |
|  `1`   | **Addition**       | Two real numbers (`double a, b`)          | Sum ($a + b$) formatted to 2 decimal places                                |
|  `2`   | **Subtraction**    | Two real numbers (`double a, b`)          | Difference ($a - b$) formatted to 2 decimal places                         |
|  `3`   | **Multiplication** | Two real numbers (`double a, b`)          | Product ($a \times b$) formatted to 2 decimal places                       |
|  `4`   | **Division**       | Dividend and Divisor (`double a, b`)      | Quotient ($a / b$) or `Error: Division by zero is not allowed.`            |
|  `5`   | **Modulus**        | Two integers (`int intA, intB`)           | Remainder ($intA \pmod{intB}$) or `Error: Modulus by zero is not allowed.` |
|  `6`   | **Power**          | Base and Exponent (`double a, b`)         | $a^b$ computed via `pow(a, b)`                                             |
|  `7`   | **Percentage**     | Value and Percentage Rate (`double a, b`) | Calculated percentage ($(a \times b) / 100.0$)                             |
|  `8`   | **Exit**           | None                                      | Graceful termination message and exit status `0`                           |

---

### 2.4 Algorithm

```text
Step 1: START.
Step 2: Initialize menu loop (do-while).
Step 3: Display scientific calculator menu (options 1 to 8).
Step 4: Prompt user for integer 'choice'.
Step 5: Validate 'choice' input:
        - If input is non-integer, flush keyboard buffer using getchar(), display error message, and repeat loop.
Step 6: Route execution using switch(choice):
        - Case 1: Read two doubles (a, b); display (a + b).
        - Case 2: Read two doubles (a, b); display (a - b).
        - Case 3: Read two doubles (a, b); display (a * b).
        - Case 4: Read two doubles (a, b);
                  If b == 0, print division by zero error;
                  Else display (a / b).
        - Case 5: Read two integers (intA, intB);
                  If non-integer, flush buffer and report error;
                  Else if intB == 0, print modulus by zero error;
                  Else display (intA % intB).
        - Case 6: Read two doubles (a, b); display pow(a, b).
        - Case 7: Read two doubles (a, b); display (a * b) / 100.0.
        - Case 8: Print exit message and break.
        - Default: Print invalid choice message.
Step 7: Repeat Steps 3–6 while (choice != 8).
Step 8: Return 0 and STOP.
```
